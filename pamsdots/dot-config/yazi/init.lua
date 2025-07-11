require("full-border"):setup()
require("projects"):setup({
	save = {
		method = "yazi", -- yazi | lua
		-- lua_save_path = "", -- comment out to get the default value
		-- windows: "%APPDATA%/yazi/state/projects.json"
		-- unix: "~/.local/state/yazi/projects.json"
	},
	last = {
		update_after_save = true,
		update_after_load = true,
		load_after_start = false,
	},
	merge = {
		quit_after_merge = false,
	},
	notify = {
		enable = true,
		title = "ppj",
		timeout = 3,
		level = "info",
	},
})

Status:children_add(function(self)
	local h = self._current.hovered
	if h and h.link_to then
		return " -> " .. tostring(h.link_to)
	else
		return ""
	end
end, 3300, Status.LEFT)
