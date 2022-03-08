local g = vim.g

g.rnvimr_enable_ex = 1 -- Make Ranger replace Netrw and be the file explorer¬
g.rnvimr_enable_picker = 1 -- Make Ranger to be hidden after picking a file¬
g.rnvimr_shadow_winblend = 25 -- Add a shadow window, value is equal to 100 will disable shadow¬

vim.api.nvim_set_keymap("n", "<leader>e", ":RnvimrToggle<cr>", {})
