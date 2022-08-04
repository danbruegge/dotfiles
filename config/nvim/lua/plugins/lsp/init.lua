local servers = {
	"bashls",
	"cssls",
	"cssmodules_ls",
	"diagnosticls",
	"graphql",
	"html",
	"ls_emmet",
	"marksman",
	"stylelint_lsp",
	"sumneko_lua",
	"tailwindcss",
	"tsserver",
	"vimls",
}

-- require("plugins.lsp.customs")

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig = require("lspconfig")
local on_attach = require("plugins.lsp.settings")

-- Disable virtual text for diagnostics
vim.diagnostic.config({
	update_in_insert = true,
	virtual_text = false,
})

for _, server in ipairs(servers) do
	if server == "tsserver" then
		require("typescript").setup({
			server = {
				on_attach = on_attach,
				on_init = function(_)
					vim.notify("tsserver started", vim.log.levels.INFO)
				end,
			},
		})
	else
		lspconfig[server].setup({ on_attach = on_attach })
	end
end
