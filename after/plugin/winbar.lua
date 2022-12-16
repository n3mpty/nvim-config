local status_ok, incline = pcall(require, "incline")
if not status_ok then
    vim.notify("Failed loading " .. req_file, vim.log.levels.ERROR)
    return
end


incline.setup({
    hide = {
        cursorline = true,
        focused_win = true,
    },
    window = {
        margin = {
            horizontal = 0,
            vertical = 0,
        },
        padding = 1,
        padding_char = " ",
        placement = {
            horizontal = "right",
            vertical = "top",
        }
    },
    render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local icon, color = require("nvim-web-devicons").get_icon_color(filename)
        return {
            { icon, guifg = color },
            { " " },
            { filename },
        }
    end,
})
