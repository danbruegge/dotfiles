require("plugins.lsp-installer-customs")

local lsp_installer = require("nvim-lsp-installer")

local servers = {
	"bashls",
	"ls_emmet",
	"sumneko_lua",
	"tsserver",
}

local servers_settings = {
	["tsserver"] = function(opts, common_on_attach)
		opts.on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false

			local ts_utils = require("nvim-lsp-ts-utils")
			ts_utils.setup({})
			ts_utils.setup_client(client)

			common_on_attach(client, bufnr)
		end
	end,
	["sumneko_lua"] = function(opts, common_on_attach)
		opts.on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
			common_on_attach(client, bufnr)
		end
	end,
}

-- helper function for mappings
local m = function(mode, key, result)
	vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd> " .. result .. "<cr>", {
		noremap = true,
		silent = true,
	})
end

local function on_attach(client)
	m("n", "<A-,>", "lua vim.lsp.buf.hover()")
	m("n", "<A-.>", "lua require('telescope.builtin').lsp_code_actions()")
	m("n", "<A-/>", "lua vim.diagnostic.open_float()")
	m("n", "gy", "lua require('telescope.builtin').lsp_type_definitions()")
	m("n", "gd", "lua require('telescope.builtin').lsp_definitions()")
	m("n", "<leader>d", "lua require('telescope.builtin').diagnostics({ bufnr=0 })")
	m("n", "gi", "lua require('telescope.builtin').lsp_implementations()")
	m("n", "gr", "lua require('telescope.builtin').lsp_references()")
	m("n", "gR", "lua vim.lsp.buf.rename()")
	m("n", "ge", "lua vim.lsp.diagnostic.goto_next()")
	m("n", "gE", "lua vim.lsp.diagnostic.goto_prev()")
end

-- Disable virtual text for diagnostics
vim.diagnostic.config({ virtual_text = false })

for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
	end
end

require("nvim-lsp-installer").on_server_ready(function(server)
	local opts = {
		on_attach = on_attach,
	}

	if servers_settings[server.name] then
		servers_settings[server.name](opts, on_attach)
	end

	server:setup(opts)
end)
