require("nvim-surround").setup({
	keymaps = {
		visual = "<leader>s",

		-- normal = "<leader>si",
		delete = "<leader>sd",
		change = "<leader>sr",
	},
})

require("which-key").register({
	["<leader>"] = {
		s = {
			name = "Surround",
			d = { "Delete pair of <prompt>" },
			r = { "Replace pair of <prompt> using <prompt>" },
			c = "which_key_ignore",
		},
	},
}, { mode = "n" })

require("which-key").register({
	["<leader>"] = {
		s = { "Surround with pair of <prompt>" },
		-- S = "which_key_ignore",
	},
}, { mode = "v" })
