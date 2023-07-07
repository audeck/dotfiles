local lsp = require("lsp-zero")

lsp.preset('recommended')
lsp.ensure_installed({
	'tsserver',
	'eslint',
	'rust_analyzer',
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<Tab>'] = cmp.mapping.select_prev_item(),
	['<C-j>'] = cmp.mapping.scroll_docs(-1),
	['<C-k>'] = cmp.mapping.select_next_item(),
	['<C-l>'] = cmp.mapping.scroll_docs(1),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),

	['<Left>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
	['<Right>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
})

lsp.set_preferences({
	--sign_icons = {},
    set_lsp_keymaps = false
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	-- Keymaps in an LSP buffer
	vim.keymap.set('n', '<leader>ld', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', '<leader>lD', function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set('n', '<leader>lr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>li', function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set('n', '<leader>lt', function() vim.lsp.buf.hover() end, opts)
end)



---- Server specific configs using lspconfig ----

local lspconfig = require('lspconfig')



---- setup() ----

lsp.setup()

