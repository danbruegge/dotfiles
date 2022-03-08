require("lualine").setup({
	options = {
		-- theme = custom_theme,
		theme = "kraken",
		section_separators = "",
		component_separators = "",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{
				"filetype",
				colored = false,
				icon_only = true,
				padding = { left = 2, right = 2 },
			},
		},
		lualine_c = {
			{
				"filename",
				file_status = true,
				path = 1,
			},
		},
		lualine_x = { "diff", "diagnostics" },
		lualine_y = {
			{
				"fileformat",
				padding = { left = 2, right = 2 },
			},
		},
		lualine_z = { "progress", "location" },
	},
})
