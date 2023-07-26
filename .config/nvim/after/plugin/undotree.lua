vim.api.nvim_set_keymap("n", "<leader>z", ":UndotreeToggle<CR>", { noremap = true })

require("which-key").register({
	["<leader>"] = {
		z = { "Toggle undotree" },
	},
}, { mode = "n" })
