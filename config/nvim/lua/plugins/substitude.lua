local map = vim.api.nvim_set_keymap

require("substitute").setup()

map("n", "s", "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
map("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
map("n", "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
map("x", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })
