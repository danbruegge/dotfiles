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
	},
})
ts.load_extension("neoclip")
ts.load_extension("fzf")

map("n", "<leader>o", ":Telescope find_files<cr>", {})
map("n", "<leader>O", ":Telescope git_status<cr>", {})
map("n", "<leader>r", ":Telescope live_grep<cr>", {})
map("n", "<leader>/", ":Telescope grep_string<cr>", {}) -- search for string under cursor
map("n", "<leader>b", ":Telescope buffers<cr>", {})
map("n", "<leader>h", ":Telescope oldfiles<cr>", {}) -- history
map("n", "<leader>hc", ":Telescope command_history<cr>", {})
map("n", "<leader>hs", ":Telescope search_history<cr>", {})
map("n", "<leader>ht", ":Telescope help_tags<cr>", {})
map("n", "<leader>m", ":Telescope marks<cr>", {})
map("n", "<leader>g", ":Telescope git_commits<cr>", {})
map("n", "<leader>gb", ":Telescope git_bcommits<cr>", {})
map("n", "<leader>gs", ":Telescope git_stash<cr>", {})
map("n", "<leader>c", ":Telescope neoclip<cr>", {})
