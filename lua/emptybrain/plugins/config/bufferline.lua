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
			icon = '',
			style = "underline",
		},
		separator_style = {"", ""}, -- { '', '' }, -- | "thick" | "thin" | { 'any', 'any' },
		modified_icon = "",
		max_prefix_length = 13,
		max_name_length = 14,
		tab_size = 20,
		color_icons = true,
		diagnostics = "nvim_lsp",
	},
	highlights = {
    buffer_selected = {
      fg = "",
      bg = "",
      italic = false,
      bold = true,
      underline = true,
    },
    separator_selected = {
        fg = 'NONE',
        bg = 'NONE'
    },
    separator_visible = {
      fg = "NONE",
      bg = "NONE",
    },
    separator = {
      fg = "NONE",
      bg = "NONE",
    },
		indicator_selected = {
      fg = "NONE",
      bg = "NONE",
		},
	},
})
