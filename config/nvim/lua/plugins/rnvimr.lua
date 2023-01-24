return {
	"kevinhwang91/rnvimr",
	keys = {
		{ "<leader>e", ":RnvimrToggle<cr>", desc = "FileExplorer" },
	},
	config = function()
		vim.g.rnvimr_enable_ex = 1 -- Make Ranger replace Netrw and be the file explorer¬
		vim.g.rnvimr_enable_picker = 1 -- Make Ranger to be hidden after picking a file¬
		vim.g.rnvimr_shadow_winblend = 25 -- Add a shadow window, value is equal to 100 will disable shadow¬
	end,
}
