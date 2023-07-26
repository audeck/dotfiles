local builtin = require('telescope.builtin')

-- Keymaps
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pa', ':Telescope find_files no_ignore=true hidden=true<CR>', {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>ps', function()
--     builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)

local telescope = require('telescope')
local actions = require('telescope.actions')
telescope.setup {
    defaults = {
        mappings = {
            n = {
                ["i"] = "move_selection_previous",
                ["I"] = "move_to_top",
                ["k"] = "move_selection_next",
                ["K"] = "move_to_bottom",
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
            v = { "View files" },
        },
    }
})

