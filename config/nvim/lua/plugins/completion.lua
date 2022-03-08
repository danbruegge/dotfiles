local cmp = require("cmp")

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

local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

cmp.setup({
	snippet = {
		expand = function(args)
			require("snippy").expand_snippet(args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
			-- Source
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[Lua]",
				path = "[Path]",
				snippy = "[Snippy]",
			})[entry.source.name]

			return vim_item
		end,
	},
	sources = cmp.config.sources({
		{ name = "snippy", group_index = 100 },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "path" },
		bufferConfig,
	}),
	mapping = {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<tab>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<s-tab>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
	},
	completion = {
		keyword_length = keywordLength,
	},
	experimental = {
		ghost_text = true,
		native_menu = false,
	},
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = {
		bufferConfig,
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
