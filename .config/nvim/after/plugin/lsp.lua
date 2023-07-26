local lsp = require("lsp-zero")

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

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    -- LSP
    vim.keymap.set("n", "<leader>ld", ":lua vim.lsp.buf.definition()", opts)
    vim.keymap.set("n", "<leader>lD", ":lua vim.lsp.buf.declaration()", opts)
    vim.keymap.set("n", "<leader>lr", ":lua vim.lsp.buf.references()", opts)
    vim.keymap.set("n", "<leader>li", ":lua vim.lsp.buf.implementation()", opts)
    vim.keymap.set("n", "<leader>lt", ":lua vim.lsp.buf.hover()<CR>", opts)
    vim.keymap
        .set("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", opts)

    -- DIAGNOSTICS
    vim.keymap.set("n", "<leader>ds", ":lua vim.diagnostic.open_float()<CR>",
                   opts)
    vim.keymap.set("n", "<leader>dk", ":lua vim.diagnostic.goto_next()<CR>",
                   opts)
    vim.keymap.set("n", "<leader>di", ":lua vim.diagnostic.goto_prev()<CR>",
                   opts)

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
                a = {"Code actions"}
            },
            d = {
                name = "Diagnostics",
                s = {"Show current"},
                i = {"Show previous"},
                k = {"Show next"}
            }
        }
    }, {mode = "n"})
end)

---- Server specific configs using lspconfig ----

local lspconfig = require("lspconfig")
lspconfig.tsserver.setup({})

---- setup() ----

lsp.setup()
