local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end


hop.setup()


local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "F", "<CMD>HopWord<CR>", opts)
keymap("n", "f", "<CMD>HopWordCurrentLine<CR>", opts)

