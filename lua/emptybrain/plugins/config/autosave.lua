local status_ok, autosave = pcall(require, "auto-save")
if not status_ok then
	return
end


autosave.setup({
	enabled = false,
	execution_message = {
		cleaning_interval = 3000,
	},
	trigger_events = { "InsertLeave", "TextChanged" },
	write_all_buffers = true,
	debounce_delay = 5000,
})
