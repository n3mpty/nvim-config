local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end


hop.setup()


local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "S", "<CMD>HopWord<CR>", opts)
keymap("n", "W", "<CMD>HopWordCurrentLine<CR>", opts)

