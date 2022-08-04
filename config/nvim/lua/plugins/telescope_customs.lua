-- Implement delta as previewer for diffs
-- Source: https://github.com/nvim-telescope/telescope.nvim/issues/605#issuecomment-790805956=
local previewers = require("telescope.previewers")
local builtin = require("telescope.builtin")
local conf = require("telescope.config")
local E = {}

local delta = previewers.new_termopen_previewer({
	get_command = function(entry)
		return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "diff", entry.value }
	end,
})

E.custom_git_status = function(opts)
	opts = opts or {}
	opts.previewer = delta

	builtin.git_status(opts)
end

return E
