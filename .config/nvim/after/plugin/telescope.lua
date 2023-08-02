local builtin = require('telescope.builtin')

-- Keymaps
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pa', function()
    builtin.find_files({ no_ignore = true })
end, {})
vim.keymap.set('n', '<leader>pA', function()
    builtin.find_files({ no_ignore = true, hidden = true })
end, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
    defaults = {
        mappings = {
            n = {
                ["i"] = actions.move_selection_previous,
                ["U"] = actions.move_to_top,
                ["k"] = actions.move_selection_next,
                ["O"] = actions.move_to_bottom
            }
        }
    }
}

-- WHICH-KEY DOCUMENTATION!!!
require('which-key').register({
    ['<leader>'] = {
        p = {
            name = "Project",
            f = { "Find file" },
            a = { "Find file (ALL!)" },
            s = { "Find string" },
            v = { "View files" }
        }
    }
})
