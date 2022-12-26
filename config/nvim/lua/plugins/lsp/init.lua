local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.api.nvim_command

local servers = {
	"astro",
	"bashls",
	"cssls",
	"cssmodules_ls",
	"diagnosticls",
	"emmet_ls",
	"eslint",
	"graphql",
	"html",
	"marksman",
	"prismals",
	"stylelint_lsp",
	"sumneko_lua",
	"tailwindcss",
	"vimls",
}

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig = require("lspconfig")
local on_attach = require("plugins.lsp.settings")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Disable virtual text for diagnostics
vim.diagnostic.config({
	update_in_insert = true,
	virtual_text = false,
	virtual_lines = { only_current_line = true },
})

for _, server in ipairs(servers) do
	if server == "emmet_ls" then
		lspconfig[server].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = {
				"html",
				"javascript",
				"javascript.jsx",
				"javascriptreact",
				"typescript",
				"typescript.tsx",
				"typescriptreact",
				"css",
				"scss",
				"sass",
				"astro",
			},
		})
	elseif server == "tsserver" then
		lspconfig[server].setup({
			on_attach = function(client, bufnr)
				require("twoslash-queries").attach(client, bufnr)
			end,
			capabilities = capabilities,
		})
	else
		lspconfig[server].setup({ on_attach = on_attach, capabilities = capabilities })
	end
end

require("typescript").setup({
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
	},
})

autocmd({ "BufWritePre" }, {
	pattern = "*.astro,*.tsx,*.ts,*.jsx,*.js",
	callback = function()
		cmd("EslintFixAll")
	end,
})

require("lsp_lines").setup()
vim.keymap.set("", "<Leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
