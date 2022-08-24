local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		offsets = {
			{ filetype = "NvimTree", text = "", padding = 1 },
			{ filetype = "Outline", text = "", padding = 1 },
		},
		indicator = {
      icon = '❘ ',
      style = 'icon'
    },
		separator_style = "thin", -- { '', '' }, -- | "thick" | "thin" | { 'any', 'any' },
		modified_icon = "",
		max_prefix_length = 13,
		max_name_length = 14,
		tab_size = 20,
		color_icons = true,
		diagnostics = "nvim_lsp",
	},
})
