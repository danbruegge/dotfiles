return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "AckslD/nvim-neoclip.lua", dependencies = { "tami5/sqlite.lua" } },
		"nvim-telescope/telescope-live-grep-args.nvim",
		"smartpde/telescope-recent-files",
	},
	keys = {
		{ "<leader>o", ":Telescope find_files<cr>" },
		{ "<leader>O", ":lua require('helper.telescope_customs').custom_git_status()<cr>" },
		{ "<leader>r", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>" },
		{ "<leader>t", ":Telescope grep_string search=📝<cr>" },
		{ "<leader>tt", ":Telescope grep_string search=👾<cr>" },
		{ "<leader>/", ":Telescope grep_string<cr>" }, -- search for string under cursor
		{ "<leader>b", ":Telescope buffers<cr>" },
		{ "<leader>h", ":lua require('telescope').extensions.recent_files.pick()<cr>" }, -- history
		{ "<leader>hc", ":Telescope command_history<cr>" },
		{ "<leader>hs", ":Telescope search_history<cr>" },
		{ "<leader>ht", ":Telescope help_tags<cr>" },
		{ "<leader>a", ":lua require('harpoon.mark').add_file()<cr>" },
		{ "<leader>m", ":Telescope harpoon marks<cr>" },
		{ "<leader>mm", ":Telescope marks<cr>" },
		{ "<leader>c", ":Telescope neoclip<cr>" },
	},
	config = function()
		local ts = require("telescope")

		require("neoclip").setup()

		ts.setup({
			defaults = {
				mappings = {
					i = {
						["<C-h>"] = require("telescope.actions.layout").toggle_preview,
						["<esc>"] = require("telescope.actions").close,
					},
				},
				path_display = { "truncate" },
			},
			pickers = {
				buffers = {
					sort_lastused = true,
				},
			},
		})
		ts.load_extension("neoclip")
		ts.load_extension("fzf")
		ts.load_extension("live_grep_args")
		ts.load_extension("recent_files")
		ts.load_extension("harpoon")
	end,
}
