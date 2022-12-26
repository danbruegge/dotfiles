local null_ls = require("null-ls")
local b = null_ls.builtins

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("prettier").setup({ bin = "prettierd" })

null_ls.setup({
	sources = {
		b.code_actions.shellcheck,
		b.diagnostics.shellcheck,
		b.code_actions.gitsigns,
		b.formatting.stylua,
		require("typescript.extensions.null-ls.code-actions"),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						-- timeout_ms = 2000,
						bufnr = bufnr,
						filter = function(c)
							return c.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})
