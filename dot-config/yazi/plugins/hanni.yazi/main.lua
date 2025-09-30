-- fzf_cd_history_final_fixed.lua
-- Place this file in your Yazi plugins directory (e.g., ~/.config/yazi/plugins/)

local M = {}

function M:entry(job)
	-- Hide the Yazi interface
	ya.hide()

	-- Define the full shell command string
	local full_shell_command = "cat ~/.config/nushell/cd_history.txt | fzf"

	-- Spawn the shell command, capturing potential error from spawn
	local child_handle, err_spawn = Command("sh")
		:arg("-c")
		:arg(full_shell_command)
		:stdin(Command.INHERIT)
		:stdout(Command.PIPED)
		:stderr(Command.INHERIT)
		:spawn()

	-- Essential: Check if the command actually started.
	if not child_handle then
		ya.notify({
			title = "Fzf Error",
			content = "Failed to start command: " .. (err_spawn or "unknown"),
			level = "error",
			timeout = 5,
		})
		return
	end

	-- Wait for fzf to finish and get its output, capturing potential error from wait
	local output, err_wait = child_handle:wait_with_output()

	-- Essential: Check if there was an error reading the output.
	if err_wait then
		ya.notify({
			title = "Fzf Error",
			content = "Failed to read output: " .. err_wait,
			level = "error",
			timeout = 5,
		})
		return
	end

	-- Check fzf's exit code.
	if output.status.code ~= 0 then
		-- No notification for cancellation, just return
		return
	end

	-- Extract the selected directory path and remove trailing newline
	local selected_dir = output.stdout:gsub("\n$", "")

	-- If a directory was selected, tell Yazi to change to it
	if selected_dir ~= "" then
		-- *** CRITICAL FIX HERE: Wrap selected_dir in a table {} ***
		ya.emit("cd", { selected_dir })
	end

	-- Yazi will automatically reappear after the plugin finishes.
end

return M
