return {
	"mhinz/vim-startify",
	config = function()
		vim.g.startify_relative_path = 1
		vim.g.startify_change_to_dir = 0
		vim.g.startify_fortune_use_unicode = 1
		vim.g.startify_update_oldfiles = 1
		vim.g.startify_use_env = 1
	end,
}
