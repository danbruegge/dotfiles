local map = vim.api.nvim_set_keymap

-- Commands
vim.cmd([[
  command! -nargs=0 Nvimrc :e ~/.config/nvim/init.lua
  command! -nargs=0 Up :Lazy check
  command! -nargs=0 Json :%!jq .
]])

map("n", "<cr>", ":w<cr>", {})
map("n", "<leader><cr>", ":wa<cr>", {})
map("n", "<leader>R", ":%s/", {})
map("n", "<leader>1", ":w !wc -w<cr>", {}) -- count words in file

-- Split windows
map("n", "<leader>n", "<c-w>n<c-w>L:Startify<cr>", {}) -- Open vertical split and switch over to it
map("n", "<leader>N", "<c-w>s<c-w>J", {}) -- Open a horizontal split and switch to it

-- Makes jumping between splited windows easier
map("n", "<a-h>", "<c-w>h", {})
map("n", "<a-j>", "<c-w>j", {})
map("n", "<a-k>", "<c-w>k", {})
map("n", "<a-l>", "<c-w>l", {})

-- Buffer
map("n", "<c-c>c", ":bp|bd #<cr>", {})
map("n", "<c-c>a", ":%bd<cr>:Startify<cr>", {})
map("n", "<Tab>", ":bnext<cr>", {})
map("n", "<S-Tab>", ":bprevious<cr>", {})

-- Yanking
map("v", "yc", '"+y', {}) -- copy to system clipboard
map("n", "Y", "y$", {}) -- copy to from cusor to end of the line. :h Y

map("n", "Q", "<NOP>", {}) -- disable 'ex' mode call

-- simple sort lines
map("v", "<leader>s", ":sort<cr>", {})
map("n", "<leader>si", ":vi{:sort<cr>", {})
