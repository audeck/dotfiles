require('harpoon').setup()

vim.keymap.set('n', '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>')
vim.keymap.set('n', '<leader>hs', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')

vim.keymap.set('n', '<leader>h1', ':lua require("harpoon.ui").nav_file(1)<CR>')
vim.keymap.set('n', '<leader>h2', ':lua require("harpoon.ui").nav_file(2)<CR>')
vim.keymap.set('n', '<leader>h3', ':lua require("harpoon.ui").nav_file(3)<CR>')
vim.keymap.set('n', '<leader>h4', ':lua require("harpoon.ui").nav_file(4)<CR>')
vim.keymap.set('n', '<leader>h5', ':lua require("harpoon.ui").nav_file(5)<CR>')
vim.keymap.set('n', '<leader>h6', ':lua require("harpoon.ui").nav_file(6)<CR>')
vim.keymap.set('n', '<leader>h7', ':lua require("harpoon.ui").nav_file(7)<CR>')
vim.keymap.set('n', '<leader>h8', ':lua require("harpoon.ui").nav_file(8)<CR>')
vim.keymap.set('n', '<leader>h9', ':lua require("harpoon.ui").nav_file(9)<CR>')

require('which-key').register({
    ['<leader>'] = {
        h = {
            name = 'Harpoon',
            a = { 'Add file' },
            s = { 'Show menu' },
            N = { 'Go to file #N' },

            ['1'] = 'which_key_ignore',
            ['2'] = 'which_key_ignore',
            ['3'] = 'which_key_ignore',
            ['4'] = 'which_key_ignore',
            ['5'] = 'which_key_ignore',
            ['6'] = 'which_key_ignore',
            ['7'] = 'which_key_ignore',
            ['8'] = 'which_key_ignore',
            ['9'] = 'which_key_ignore',
        }
    }
})
