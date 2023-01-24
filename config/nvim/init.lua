require("init_lazy")

vim.api.nvim_set_keymap("n", "<Space>", "", {})
vim.g.mapleader = " "
vim.o.termguicolors = true

require("lazy").setup("plugins")

require("common")
require("mappings")

-- load as last one for project specific settings
-- require("projects")
