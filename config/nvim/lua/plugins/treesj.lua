require("treesj").setup({
	use_default_keymaps = false,
})

vim.api.nvim_set_keymap("n", "<leader>j", ":TSJToggle<cr>", {})
