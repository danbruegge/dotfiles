require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
	sync_install = false,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
	playground = {
		enable = true,
	},
})

vim.api.nvim_set_keymap("n", "<leader>T", ":TSHighlightCapturesUnderCursor<cr>", {})

require("colorizer").setup({
	"lua",
	"css",
	"javascript",
	"javascriptreact",
	"scss",
	"typescript",
	"typescriptreact",
	"yaml",
}, {
	css = true,
	css_fn = true,
})
