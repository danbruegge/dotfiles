return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/playground",
		"norcalli/nvim-colorizer.lua",
	},
	keys = {
		{ "<leader>T", ":TSHighlightCapturesUnderCursor<cr>" },
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
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
	end,
}
