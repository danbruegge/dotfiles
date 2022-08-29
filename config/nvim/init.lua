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
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"jose-elias-alvarez/typescript.nvim",
		})

		-- formatting
		use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } })

		-- completion
		use({
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"dcampos/nvim-snippy",
			"dcampos/cmp-snippy",
			"onsails/lspkind-nvim",
		})

		-- treesitter
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use("nvim-treesitter/playground")

		-- telescope
		use({
			{ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			{ "AckslD/nvim-neoclip.lua", requires = { "tami5/sqlite.lua", module = "sqlite" } },
		})

		-- statusline
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})

		-- vim code
		use("mhinz/vim-startify")
		use("kevinhwang91/rnvimr")
		use("tpope/vim-sleuth")
		use("AaronLasseigne/yank-code")

		-- other
		use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
		use("windwp/nvim-autopairs")
		use("windwp/nvim-ts-autotag")
		use("kylechui/nvim-surround")
		use("numToStr/Comment.nvim")
		use("norcalli/nvim-colorizer.lua")
		use("lukas-reineke/indent-blankline.nvim")
		use("ellisonleao/glow.nvim")
		use({
			"bennypowers/nvim-regexplainer",
			requires = {
				"nvim-lua/plenary.nvim",
				"MunifTanjim/nui.nvim",
			},
		})
		use("lukas-reineke/headlines.nvim")
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
require("plugins.lsp")
require("plugins.formatting")
require("plugins.syntax")
require("plugins.completion")
require("plugins.telescope")
require("plugins.startify")
require("plugins.statusline")
require("plugins.git")
require("plugins.rnvimr")
require("plugins.indent")
require("nvim-autopairs").setup({
	fast_wrap = {
		highlight = "IncSearch",
	}, -- setup function and press <a-e> to use fast_wrap
	check_ts = true,
	map_c_h = true,
})
require("nvim-ts-autotag").setup()
require("nvim-surround").setup()
require("Comment").setup()
require("regexplainer").setup({ auto = true })
require("headlines").setup()

-- load as last one for project specific settings
-- require("projects")
