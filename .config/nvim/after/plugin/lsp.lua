local lsp = require("lsp-zero")
local telescope = require("telescope.builtin")

lsp.preset("recommended")
lsp.ensure_installed({ "lua_ls", "tsserver", "eslint", "rust_analyzer" })

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<Tab>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.scroll_docs(-1),
    ["<C-k>"] = cmp.mapping.select_next_item(),
    ["<C-l>"] = cmp.mapping.scroll_docs(1),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),

    ["<Left>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<Right>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" })
})

lsp.set_preferences({ set_lsp_keymaps = false })
lsp.setup_nvim_cmp({ mapping = cmp_mappings })



------------------------------- LSP on_attach() -------------------------------

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- LSP functions
    local definitions = function() telescope.lsp_definitions() end
    local declarations = function() vim.lsp.buf.declaration() end
    local references = function() telescope.lsp_references() end
    local implementations = function() telescope.lsp_implementations() end
    local inspect_type = function() vim.lsp.buf.hover() end
    local code_actions = function() vim.lsp.buf.code_action() end

    -- LSP keymaps
    vim.keymap.set("n", "<leader>ld", definitions, opts)
    vim.keymap.set("n", "<leader>lD", declarations, opts)
    vim.keymap.set("n", "<leader>lr", references, opts)
    vim.keymap.set("n", "<leader>li", implementations, opts)
    vim.keymap.set("n", "<leader>lt", inspect_type, opts)
    vim.keymap.set("n", "<leader>la", code_actions, opts)

    -- DIAGNOSTICS functions
    local diagnostics_show = function() vim.diagnostic.open_float() end
    local diagnostics_all = function() telescope.diagnostics() end
    local diagnostics_file = function()
        telescope.diagnostics({ bufnr = bufnr })
    end

    -- DIAGNOSTICS keymaps
    vim.keymap.set("n", "<leader>da", diagnostics_all, opts)
    vim.keymap.set("n", "<leader>df", diagnostics_file, opts)
    vim.keymap.set("n", "<leader>ds", diagnostics_show, opts)

    -- which-key
    require("which-key").register({
        ["<leader>"] = {
            l = {
                name = "LSP",
                d = { "See definition" },
                D = { "See declaration" },
                i = { "See implementation" },
                r = { "See references" },
                t = { "See variable type" },
                a = { "See code actions" }
            },
            d = {
                name = "Diagnostics",
                s = { "Show current" },
                f = { "Show all in file" },
                a = { "Show all" }
            }
        }
    }, { mode = "n" })
end)



------------------- Server specific configs using lspconfig -------------------

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're
                -- using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized,
            -- but unique nonetheless, identifier
            telemetry = {
                enable = false,
            },
            format = {
                enable = true,
            },
        },
    },
})

lspconfig.csharp_ls.setup({
    -- Better root directory matching for multi-.csproj projects
    -- containing a single sulution
    root_dit = function(startpath)
        return lspconfig.util.root_pattern("*.sln")(startpath) or
            lspconfig.util.root_pattern("*.csproj")(startpath) or
            lspconfig.util.root_pattern("*.fsproj")(startpath) or
            lspconfig.util.root_pattern(".git")(startpath)
    end
})



----------------------------------- setup() -----------------------------------

lsp.setup()
