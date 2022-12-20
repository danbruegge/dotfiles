local autocmd = vim.api.nvim_create_autocmd
local map = vim.api.nvim_set_keymap

local function on_attach()
	map("n", "<A-,>", ":lua vim.lsp.buf.hover()<cr>", {})
	map("n", "<A-.>", ":lua vim.lsp.buf.code_action()<cr>", {})
	map("n", "<A-/>", ":lua vim.diagnostic.open_float()<cr>", {})
	map("n", "gy", ":lua require('telescope.builtin').lsp_type_definitions()<cr>", {})
	map("n", "gd", ":lua require('telescope.builtin').lsp_definitions()<cr>", {})
	map("n", "<leader>d", ":lua require('telescope.builtin').diagnostics({ bufnr=0 })<cr>", {})
	map("n", "gi", ":lua require('telescope.builtin').lsp_implementations()<cr>", {})
	map("n", "gI", ":InspectTwoslashQueries<cr>", {})
	map("n", "gr", ":lua require('telescope.builtin').lsp_references()<cr>", {})
	map("n", "gR", ":lua vim.lsp.buf.rename()<cr>", {})
	map("n", "ge", ":lua vim.diagnostic.goto_next()<cr>", {})
	map("n", "gE", ":lua vim.diagnostic.goto_prev()<cr>", {})

	autocmd("CursorHold", {
		pattern = "*",
		callback = function()
			vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
		end,
	})
end

return on_attach
