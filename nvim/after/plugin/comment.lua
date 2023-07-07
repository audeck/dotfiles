require('nvim_comment').setup({
    create_mappings = false,
    comment_empty = true,
})

vim.keymap.set('v', '<leader>/', ":'<,'>CommentToggle<CR>")
