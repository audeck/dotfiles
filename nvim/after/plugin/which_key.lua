local wk = require('which-key')
local enabled = true

-- See: https://github.com/folke/which-key.nvim#readme
if enabled then
    vim.o.timeout = true
    vim.o.timeoutlen = 1

    wk.setup({
        window = {
            border = 'single',
            padding = { 0, 0, 0, 0 },
        },

        plugins = {
            spelling = { enabled = false },
            presets = {
                operators = false,
                motions = false,
                text_objects = false,
                windows = true,
                nav = false,
                z = false,
                g = false,
            },
        },

        triggers = {
            '<leader>',  -- plugins
            '<C-w>',     -- windows
        }
    })

    wk.register({
        ['<leader>'] = {
            p = {
                name = "Project",
                f = { "Find file" },
                s = { "Find string" },
                v = { "View files" },
            },
            d = {
                name = "Diagnostics",
                s = { "Show current" },
                i = { "Show previous" },
                k = { "Show next" },
            },
            g = {
                name = "Git",
                s = { "Show status" },
                f = { "Find git file" },
            },
            s = {
                name = "Surround",
                d = { "Delete pair of <prompt>" },
                r = { "Replace pair of <prompt> using <prompt>" },
                c = "which_key_ignore",
            },
            l = {
                name = "LSP",
                d = { "See definition" },
                D = { "See declaration" },
                i = { "See implementation" },
                r = { "See references" },
                t = { "See variable type" },
            },
            z = { "Toggle undotree" },
        },
    }, { mode = 'n' })

    wk.register({
        ['<leader>'] = {
            ['/'] = { "Toggle comment for selected lines" },
            s = { "Surround with pair of <prompt>" },
            S = "which_key_ignore",
        }
    }, { mode = 'v' })
end

