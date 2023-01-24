-- Implement delta as previewer for diffs
-- Source:
--		- https://github.com/nvim-telescope/telescope.nvim/issues/605#issuecomment-790805956=
--		- https://github.com/bluz71/dotfiles/blob/master/nvim/lua/util/telescope-commands.lua
local previewers = require("telescope.previewers")
local builtin = require("telescope.builtin")
local conf = require("telescope.config")
local E = {}

local delta = previewers.new_termopen_previewer({
	get_command = function(entry)
		if entry.status == "D " then
			return { "git", "show", "HEAD:" .. entry.value }
		elseif entry.status == "??" then
			return { "bat", "--style=plain", entry.value }
		end

		return {
			"git",
			"-c",
			"core.pager=delta",
			"-c",
			"delta.pager=less -R",
			"diff",
			entry.value,
		}
	end,
})

E.custom_git_status = function(opts)
	opts = opts or {}
	opts.previewer = delta

	builtin.git_status(opts)
end

return E
