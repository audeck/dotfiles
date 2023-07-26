-- Enables transparency on most UI groups.
require('transparent').setup({
    extra_groups = {
        'NormalFloat',
        'NvimTreeNormal',
    },
})

vim.api.nvim_command('TransparentEnable')

