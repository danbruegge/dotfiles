local g = vim.g
local map = vim.api.nvim_set_keymap

g.scratchpad_autostart = 0
-- g.scratchpad_daily = 1
g.scratchpad_textwidth = 120

map("n", "<leader>cc", ":ScratchPad<cr>", {})
