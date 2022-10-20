local status_ok, cinnamon = pcall(require, "cinnamon")
if not status_ok then
    vim.notify("Failed loading " .. req_file, vim.log.levels.ERROR)
    return
end

cinnamon.setup({
    -- KEYMAPS:
    default_keymaps = true, -- Create default keymaps.
    extra_keymaps = false, -- Create extra keymaps.
    extended_keymaps = false, -- Create extended keymaps.
    override_keymaps = true, -- The plugin keymaps will override any existing keymaps.

    -- OPTIONS:
    always_scroll = false, -- Scroll the cursor even when the window hasn't scrolled.
    centered = true, -- Keep cursor centered in window when using window scrolling.
    default_delay = 7, -- The default delay (in ms) between each line when scrolling.
    hide_cursor = false, -- Hide the cursor while scrolling. Requires enabling termguicolors!
    horizontal_scroll = true, -- Enable smooth horizontal scrolling when view shifts left or right.
    max_length = 500, -- Maximum length (in ms) of a command. The line delay will be
    -- re-calculated. Setting to -1 will disable this option.
    scroll_limit = -1, -- Max number of lines moved before scrolling is skipped. Setting
    -- to -1 will disable this option.
})
vim.keymap.set({ 'n', 'x' }, '<C-k>', "<Cmd>lua Scroll('<C-u>', 1, 1)<CR>")
vim.keymap.set({ 'n', 'x' }, '<C-j>', "<Cmd>lua Scroll('<C-d>', 1, 1)<CR>")