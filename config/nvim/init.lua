require("packer_compiled")

require("packer").startup({
	function(use)
		use("lewis6991/impatient.nvim")

		-- package management

		use("wbthomason/packer.nvim")

		-- colorscheme
		use("~/workspace/kraken")

		-- LSP
		use({
			"neovim/nvim-lspconfig",
			"williamboman/nvim-lsp-installer",
		})

		-- formatting
		use({
			{ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } },
			"jose-elias-alvarez/nvim-lsp-ts-utils",
		})

		-- completion
		use({
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"dcampos/nvim-snippy",
			"dcampos/cmp-snippy",
		})

		-- treesitter
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use("nvim-treesitter/playground")

		-- telescope
		use({
			{ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			{ "AckslD/nvim-neoclip.lua", requires = { "tami5/sqlite.lua", module = "sqlite" } },
			use("nvim-telescope/telescope-file-browser.nvim"),
		})

		-- statusline
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})

		-- other
		use("mhinz/vim-startify") -- vim code
		use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
		use("kevinhwang91/rnvimr") -- vim code
		use("jiangmiao/auto-pairs") -- vim code
		use("AaronLasseigne/yank-code") -- vim code
		use("blackCauldron7/surround.nvim")
		use("numToStr/Comment.nvim")
		use("norcalli/nvim-colorizer.lua")
		use("lukas-reineke/indent-blankline.nvim")
		use("ellisonleao/glow.nvim")
		use({
			"nmac427/guess-indent.nvim",
			config = function()
				require("guess-indent").setup({})
			end,
		})
	end,
	config = {
		compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})

require("common")
require("mappings")
require("plugins.lsp-installer")
require("plugins.formatting")
require("plugins.syntax")
require("plugins.completion")
require("snippy").setup({
	mappings = {
		is = {
			["<Tab>"] = "expand_or_advance",
			["<S-Tab>"] = "previous",
		},
	},
})
require("plugins.nvim-telescope")
require("plugins.startify")
require("plugins.statusline")
require("plugins.git")
require("plugins.rnvimr")
require("surround").setup({ mappings_style = "surround" })
require("Comment").setup()
require("plugins.indent")

-- load as last one for project specific settings
require("projects")
