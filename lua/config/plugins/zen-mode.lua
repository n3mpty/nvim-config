local status_ok, zen_mode = pcall(require, "zen-mode")
if not status_ok then
    vim.notify("Failed loading " .. req_file, vim.log.levels.ERROR)
    return
end


zen_mode.setup({
    window = {
        backdrop = 0.95,
        width = 140,
        options = {
            number = true,
            relativenumber = true,
            cursorline = true,
        }
    },
    plugins = {
        kitty = {
            enabled = true,
            font = "+5",
        },
    }
})
