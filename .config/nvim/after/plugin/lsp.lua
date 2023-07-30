local lsp = require("lsp-zero")
local telescope = require("telescope.builtin")

lsp.preset("recommended")
lsp.ensure_installed({"tsserver", "eslint", "rust_analyzer"})

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<Tab>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.scroll_docs(-1),
    ["<C-k>"] = cmp.mapping.select_next_item(),
    ["<C-l>"] = cmp.mapping.scroll_docs(1),
    ["<CR>"] = cmp.mapping.confirm({select = true}),
    ["<C-Space>"] = cmp.mapping.complete(),

    ["<Left>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}),
    ["<Right>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"})
})

lsp.set_preferences({set_lsp_keymaps = false})

lsp.setup_nvim_cmp({mapping = cmp_mappings})

lsp.on_attach(function(_, bufnr)
    local opts = {buffer = bufnr, remap = false}

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
        telescope.diagnostics({bufnr = bufnr})
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
                d = {"See definition"},
                D = {"See declaration"},
                i = {"See implementation"},
                r = {"See references"},
                t = {"See variable type"},
                a = {"See code actions"}
            },
            d = {name = "Diagnostics", s = {"Show current"}, a = {"Show all"}}
        }
    }, {mode = "n"})
end)

---- Server specific configs using lspconfig ----

local lspconfig = require("lspconfig")
lspconfig.tsserver.setup({}) -- example

---- setup() ----

lsp.setup()
