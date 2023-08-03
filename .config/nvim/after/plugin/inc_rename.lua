vim.keymap.set("n", "<leader>lR",
               function() return ":IncRename " .. vim.fn.expand("<cword>") end,
               {expr = true})

require("which-key").register({["<leader>"] = {l = {R = {"Rename variable"}}}})
