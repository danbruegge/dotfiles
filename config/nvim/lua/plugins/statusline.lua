local kraken = require("kraken.colors")
local custom_fname = require("lualine.components.filename"):extend()
local highlight = require("lualine.highlight")
local default_status_colors = { saved = kraken.g50, modified = kraken.special }

function custom_fname:init(options)
	custom_fname.super.init(self, options)
	self.status_colors = {
		saved = highlight.create_component_highlight_group(
			{ fg = default_status_colors.saved },
			"filename_status_saved",
			self.options
		),
		modified = highlight.create_component_highlight_group(
			{ fg = default_status_colors.modified },
			"filename_status_modified",
			self.options
		),
	}
	if self.options.color == nil then
		self.options.color = ""
	end
end

function custom_fname:update_status()
	local data = custom_fname.super.update_status(self)
	data = highlight.component_format_highlight(
		vim.bo.modified and self.status_colors.modified or self.status_colors.saved
	) .. data
	return data
end

require("lualine").setup({
	options = {
		theme = "kraken",
		section_separators = "",
		component_separators = "",
		globalstatus = true,
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
			"%=",
			{
				custom_fname,
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

require("incline").setup()
