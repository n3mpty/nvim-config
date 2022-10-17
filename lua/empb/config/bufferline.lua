local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    vim.notify("Failed loading " .. req_file, vim.log.levels.ERROR)
    return
end

bufferline.setup({
    options = {
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 16,
        separator_style = "thin",
        offsets = {
            {
                filetype = "undotree",
                text = "Undotree",
                highlight = "PanelHeading",
                padding = 1,
            },
            {
                filetype = "NvimTree",
                text = "Explorer",
                highlight = "PanelHeading",
                padding = 1,
            },
            {
                filetype = "DiffviewFiles",
                text = "Diff View",
                highlight = "PanelHeading",
                padding = 1,
            },
            {
                filetype = "flutterToolsOutline",
                text = "Flutter Outline",
                highlight = "PanelHeading",
            },
            {
                filetype = "packer",
                text = "Packer",
                highlight = "PanelHeading",
                padding = 1,
            },
        },
    },

    -- highlights = {
    --     fill = {
    --         bg = "#212121",
    --     },
    --     background = {
    --         -- fg = "<colour-value-here>",
    --         -- bg = "<colour-value-here>",
    --     },
    --     tab = {
    --         fg = "#757575",
    --         bg = "#181818",
    --     },
    --     tab_selected = {
    --         fg = "#ff9800",
    --         bg = "#212121",
    --     },
    --     tab_close = {
    --         fg = "#757575",
    --         bg = "#181818",
    --     },
    --     close_button = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     close_button_visible = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     close_button_selected = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     buffer_visible = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     buffer_selected = {
    --         fg = normal_fg,
    --         bg = "<colour-value-here>",
    --         bold = true,
    --         italic = true,
    --     },
    --     numbers = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     numbers_visible = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     numbers_selected = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --         bold = true,
    --         italic = true,
    --     },
    --     diagnostic = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     diagnostic_visible = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     diagnostic_selected = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --         bold = true,
    --         italic = true,
    --     },
    --     hint = {
    --         fg = "<colour-value-here>",
    --         sp = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     hint_visible = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     hint_selected = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --         sp = "<colour-value-here>",
    --         bold = true,
    --         italic = true,
    --     },
    --     hint_diagnostic = {
    --         fg = "<colour-value-here>",
    --         sp = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     hint_diagnostic_visible = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     hint_diagnostic_selected = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --         sp = "<colour-value-here>",
    --         bold = true,
    --         italic = true,
    --     },
    --     info = {
    --         fg = "<colour-value-here>",
    --         sp = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     info_visible = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     info_selected = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --         sp = "<colour-value-here>",
    --         bold = true,
    --         italic = true,
    --     },
    --     info_diagnostic = {
    --         fg = "<colour-value-here>",
    --         sp = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     info_diagnostic_visible = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     info_diagnostic_selected = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --         sp = "<colour-value-here>",
    --         bold = true,
    --         italic = true,
    --     },
    --     warning = {
    --         fg = "<colour-value-here>",
    --         sp = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     warning_visible = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     warning_selected = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --         sp = "<colour-value-here>",
    --         bold = true,
    --         italic = true,
    --     },
    --     warning_diagnostic = {
    --         fg = "<colour-value-here>",
    --         sp = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     warning_diagnostic_visible = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     warning_diagnostic_selected = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --         sp = warning_diagnostic_fg,
    --         bold = true,
    --         italic = true,
    --     },
    --     error = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --         sp = "<colour-value-here>",
    --     },
    --     error_visible = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     error_selected = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --         sp = "<colour-value-here>",
    --         bold = true,
    --         italic = true,
    --     },
    --     error_diagnostic = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --         sp = "<colour-value-here>",
    --     },
    --     error_diagnostic_visible = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     error_diagnostic_selected = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --         sp = "<colour-value-here>",
    --         bold = true,
    --         italic = true,
    --     },
    --     modified = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     modified_visible = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     modified_selected = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     duplicate_selected = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --         italic = true,
    --     },
    --     duplicate_visible = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --         italic = true,
    --     },
    --     duplicate = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --         italic = true,
    --     },
    --     separator_selected = {
    --         fg = "#121212",
    --         bg = "#212121",
    --     },
    --     separator_visible = {
    --         fg = "#575757",
    --         bg = "#1e1e1e",
    --     },
    --     separator = {
    --         fg = "#121212",
    --         bg = "#181818",
    --     },
    --     indicator_selected = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --     },
    --     pick_selected = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --         bold = true,
    --         italic = true,
    --     },
    --     pick_visible = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --         bold = true,
    --         italic = true,
    --     },
    --     pick = {
    --         fg = "<colour-value-here>",
    --         bg = "<colour-value-here>",
    --         bold = true,
    --         italic = true,
    --     },
    --     offset_separator = {
    --         fg = win_separator_fg,
    --         bg = separator_background_color,
    --     },
    
})
