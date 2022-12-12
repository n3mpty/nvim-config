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
        --[[ separator_style = { "", "" }, ]]
        color_icons = false,
        show_buffer_icons = false,
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
                filetype = "neo-tree",
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
            highlights = {},
        },
    },
})
