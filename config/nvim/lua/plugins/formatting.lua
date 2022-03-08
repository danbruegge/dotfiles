local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.code_actions.eslint_d,
		null_ls.builtins.formatting.prettierd.with({
			condition = function(utils)
				return utils.root_matches("webfleet") or utils.root_has_file(".md") or utils.root_has_file(".json")
			end,
		}),
		null_ls.builtins.formatting.stylua,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			-- Need the timeout of 2000 to let null-ls have chance to find local executables
			-- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 10000)")
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
