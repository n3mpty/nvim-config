local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
    vim.notify("Failed loading " .. req_file, vim.log.levels.ERROR)
    return
end

surround.setup({
    keymaps = {
        normal = "s",
        normal_cur = "ss",
        normal_line = "S",
        normal_cur_line = "SS",
        visual = "s",
        visual_line = "gS",
        delete = "ds",
        change = "cs",
    },
})
