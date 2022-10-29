local status_ok, notify = pcall(require, "notify")
if not status_ok then
	return
end

notify.setup({
	-- Animation style (see below for details)
	stages = "static",

	-- Function called when a new window is opened, use for changing win settings/config
	on_open = nil,

	-- Function called when a window is closed
	on_close = nil,

	-- Render function for notifications. See notify-render()
	render = "default",

	-- Default timeout for notifications
	timeout = 3000,

	-- For stages that change opacity this is treated as the highlight behind the window
	-- Set this to either a highlight group or an RGB hex value e.g. "#000000"
	background_colour = "NONE",

	-- Minimum width for notification windows
	minimum_width = 10,

	top_down = true,

	-- Icons for the different levels
})

vim.notify = notify

local notify_filter = vim.notify
vim.notify = function(msg, ...)
	if msg:match("character_offset must be called") then
		return
	end
	if msg:match("method textDocument") then
		return
	end

	notify_filter(msg, ...)
end
