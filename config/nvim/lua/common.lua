local g = vim.g
local o = vim.o
local wo = vim.wo
local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.api.nvim_command

o.termguicolors = true
cmd("colorscheme kraken")

-- this option is deprecated without an alternative
cmd("set gdefault") -- set :substitute flag g to on

g.cmdheight = 2 -- Set the command window height to 2 lines, to avoid many cases of having to press <Enter> to continue
g.inccomand = "split" -- will open a split window with all searches of document from :substitute
g.completeopt = "menu,menuone,noselect"

-- change options
-- useful when using `cw`. Adds a $ to the end of word
o.cpoptions = o.cpoptions .. "$"

g.lazyredraw = true -- don't update the display while executing macros
o.dir = "/tmp"
o.scrolloff = 8 -- When the page starts to scroll, keep the cursor 8 lines from the top and 8 lines from the bottom
-- o.wildignore = "*node_modules/**"

wo.wrap = false
wo.cursorline = true
wo.foldmethod = "indent"
wo.foldlevel = 99

o.winblend = 5

-- Numbers
wo.number = true
-- set relativenumber as default and switch if in insert mode to number
-- https://jeffkreeftmeijer.com/vim-number/
autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
	pattern = "*",
	callback = function()
		if wo.number and vim.api.nvim_get_mode ~= "i" then
			wo.relativenumber = true
		end
	end,
})
autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
	pattern = "*",
	callback = function()
		if wo.number then
			wo.relativenumber = false
		end
	end,
})

wo.signcolumn = "yes"

-- Set and display line ending
g.ruler = true
wo.colorcolumn = "80,100,120"

-- Help
-- Open the help window on the Vertical Left side
autocmd("FileType", {
	pattern = { "help", "h" },
	callback = function()
		cmd("wincmd L")
	end,
})

-- Tabbing
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2

-- Enable persistent undo, that undo history persists across vim sessions
o.undofile = true
g.undodir = "~/.config/nvim/undo"

-- auto resize splits on window/terminal resize
autocmd("VimResized", {
	pattern = "*",
	callback = function()
		cmd("wincmd =")
	end,
})

-- highlight yanked text since NEOVIM 0.5.0
autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch" })
	end,
})

o.updatetime = 500
