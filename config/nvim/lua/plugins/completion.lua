local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local keywordLength = 1
local bufferConfig = {
	name = "buffer",
	option = {
		keyword_length = keywordLength,
		keyword_pattern = [[\k\+]],
		get_bufnrs = function()
			return vim.api.nvim_list_bufs()
		end,
	},
}

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

cmp.setup({
	snippet = {
		expand = function(args)
			require("snippy").expand_snippet(args.body)
		end,
	},
	formatting = {
		format = require("lspkind").cmp_format(),
	},
	sources = cmp.config.sources({
		{ name = "snippy", group_index = 100 },
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lua" },
		{ name = "path" },
		bufferConfig,
	}),
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<tab>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		-- ["<s-tab>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<cr><tab>"] = cmp.mapping(function()
			vim.api.nvim_feedkeys(
				vim.fn["copilot#Accept"](vim.api.nvim_replace_termcodes("<Tab>", true, true, true)),
				"n",
				true
			)
		end),
		["<C-h>"] = cmp.mapping(function()
			vim.api.nvim_feedkeys(vim.fn["copilot#Previous"](), "n", true)
		end),
		["<C-l>"] = cmp.mapping(function()
			vim.api.nvim_feedkeys(vim.fn["copilot#Next"](), "n", true)
		end),
	}),
	completion = {
		keyword_length = keywordLength,
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = cmp.config.sources({
		bufferConfig,
		{ name = "nvim_lsp_document_symbol" },
	}),
	mapping = cmp.mapping.preset.cmdline(),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	mapping = cmp.mapping.preset.cmdline(),
})

require("snippy").setup({
	mapping = {
		is = {
			["<Tab>"] = "expand_or_advance",
			["<S-Tab>"] = "previous",
		},
	},
})
