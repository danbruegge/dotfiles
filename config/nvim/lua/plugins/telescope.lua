local ts = require("telescope")
local map = vim.api.nvim_set_keymap

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

map("n", "<leader>o", ":Telescope find_files<cr>", {})
map("n", "<leader>O", ":lua require('plugins.telescope_customs').custom_git_status()<cr>", {})
map("n", "<leader>r", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", {})
map("n", "<leader>t", ":Telescope grep_string search=📝<cr>", {})
map("n", "<leader>tt", ":Telescope grep_string search=👾<cr>", {})
map("n", "<leader>/", ":Telescope grep_string<cr>", {}) -- search for string under cursor
map("n", "<leader>b", ":Telescope buffers<cr>", {})
map("n", "<leader>h", ":lua require('telescope').extensions.recent_files.pick()<cr>", {}) -- history
map("n", "<leader>hc", ":Telescope command_history<cr>", {})
map("n", "<leader>hs", ":Telescope search_history<cr>", {})
map("n", "<leader>ht", ":Telescope help_tags<cr>", {})
map("n", "<leader>a", ":lua require('harpoon.mark').add_file()<cr>", {})
map("n", "<leader>m", ":Telescope harpoon marks<cr>", {})
map("n", "<leader>mm", ":Telescope marks<cr>", {})
map("n", "<leader>c", ":Telescope neoclip<cr>", {})
