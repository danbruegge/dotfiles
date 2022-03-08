require("indent_blankline").setup({
	char = "",
	use_treesitter = true,
	show_first_indent_level = false,
	space_char_blankline = " ",
	show_current_context = true,
	context_char = "|",
	filetype_exclude = {
		"lspinfo",
		"packer",
		"checkhealth",
		"startify",
		"help",
	},
})
