require("nvim_comment").setup({
	create_mappings = false,
	comment_empty = true,
})

vim.keymap.set("v", "<leader>/", ":'<,'>CommentToggle<CR>")

require("which-key").register({
	["<leader>"] = {
		["/"] = { "Toggle comment for selected lines" },
	},
}, { mode = "v" })
