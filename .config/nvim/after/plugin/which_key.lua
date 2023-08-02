local wk = require("which-key")
local enabled = true

-- See: https://github.com/folke/which-key.nvim#readme
if enabled then
    vim.o.timeout = true
    vim.o.timeoutlen = 1

    wk.setup({
        window = { border = "single", padding = { 0, 0, 0, 0 } },

        plugins = {
            spelling = {
                enabled = false,
            },
            presets = {
                operators = false,
                motions = false,
                text_objects = false,
                windows = true,
                nav = false,
                z = false,
                g = false,
            }
        },

        triggers = {
            "<leader>", -- plugins
            "<C-w>"     -- windows
        },
    })
end
