--
-- This file is only for specific projects settings
--
local exec = vim.api.nvim_exec

-- WEBFLEET
-- exec([[ autocmd BufRead,BufNewFile */webfleet/* setlocal ts=4 sw=4 sts=4 ]], false)
exec([[ autocmd BufReadPost * :silent GuessIndent ]], false)
