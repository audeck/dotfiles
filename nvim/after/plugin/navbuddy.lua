-- Used exclusively for code navigation. For more functionality, see the
-- readme: https://github.com/SmiteshP/nvim-navbuddy#readme
local actions = require('nvim-navbuddy.actions')

require('nvim-navbuddy').setup({
    use_default_mappings = false,

    mappings = {
        ['k'] = actions.next_sibling(),
        ['i'] = actions.previous_sibling(),

        ['j'] = actions.parent(),
        ['l'] = actions.children(),

        ['<enter>'] = actions.select(),
        ['<esc>'] = actions.close(),
    },

    lsp = {
        auto_attach = true,
    }
})

vim.keymap.set('n', '<leader>n', ':Navbuddy<CR>')

require('which-key').register({
    ['<leader>'] = {
        n = { 'Open Navbuddy' }
    }
})

