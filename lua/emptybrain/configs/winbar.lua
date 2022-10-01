local status_ok, winbar = pcall(require, "winbar")
if not status_ok then
	vim.notify("Failed loading " .. req_file, vim.log.levels.ERROR)
	return
end

winbar.setup({
	enabled = true,

	show_file_path = true,
	show_symbols = true,

	colors = {
		path = "", -- You can customize colors like #c946fd
		file_name = "",
		symbols = "",
	},

	icons = {
		file_icon_default = "",
		seperator = "›",
		editor_state = "●",
		lock_icon = "",
	},

	exclude_filetype = {
		"help",
		"startify",
		"dashboard",
		"packer",
		"neogitstatus",
		"NvimTree",
		"Trouble",
		"alpha",
		"lir",
		"Outline",
		"spectre_panel",
		"toggleterm",
		"DressingSelect",
		"Jaq",
		"harpoon",
		"dapui_scopes",
		"dapui_breakpoints",
		"dapui_stacks",
		"dapui_watches",
		"dap-repl",
		"dap-terminal",
		"dapui_console",
		"lab",
		"Markdown",
		"",
	},
})
