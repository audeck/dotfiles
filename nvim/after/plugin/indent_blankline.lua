-- Not sure about this one; perhaps if you need this plugin,
-- you've already messed up along the way.
-- NOTE: Contrary to this plugin's name, it only shows indentation (levels).
require("indent_blankline").setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = false,

	filetype_exclude = {
		-- default
		"",
		"lspinfo",
		"packer",
		"checkhealth",
		"help",
		"man",

		-- custom
		"text",
		"markdown",
		"harpoon",
	},
})
