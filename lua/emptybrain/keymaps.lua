local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set


--Remap space as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Write
keymap("n", "<C-s>", "<cmd>w!<cr>", opts)
keymap("i", "<C-s>", "<cmd>w!<cr>", opts)

-- Normal --

keymap("n", "<space>c", "<CMD>source $MYVIMRC<CR>")

-- Hop
keymap("n", "F", "<CMD>HopWord<CR>", opts)
-- keymap("n", "s", "<CMD>HopWordCurrentLine<CR>", opts)
-- keymap("v", "s", "<CMD>HopWord<CR>", opts)

-- Inline text
keymap("n", "<space>dl", "<cmd>lua vim.diagnostic.config({ virtual_text = true, underline = true})<cr>")
keymap("n", "<space>dd", "<cmd>lua vim.diagnostic.config({ virtual_text = false, underline = true})<cr>")

--  Comment
keymap("n", "<space>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<space>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

--[[ keymap("n", "<space>/", "<cmd>lua require('Comment.api').toggle.linewise.current('line')<cr>", opts) ]]
--[[ keymap("v", "<space>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", opts) ]]
--[[ keymap("x", "<space>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', opts) ]]
--
keymap("n", "<ESC>", "<cmd>:noh<cr>")

-- Invert insert keys
keymap("n", "i", "a", opts)
keymap("n", "I", "A", opts)
keymap("n", "a", "i", opts)
keymap("n", "A", "I", opts)
--

keymap("n", "<C-p>", "%", opts)
keymap("v", "<C-p>", "%", opts)
---
keymap("n", "<space>l", "$") -- end line
keymap("n", "<space>h", "^") -- start line
--
-- Split View
keymap("n", "\\", "<cmd>split<cr>", opts) -- Horizontal split
keymap("n", "|", "<cmd>vsplit<cr>", opts) -- Vertical split

-- Buffer
keymap("n", "C", "<cmd>Bdelete<cr>", opts) -- Close buffer
--

-- Quit
keymap("n", "<C-q>", "<cmd>q!<cr>", opts)

-- Better window navigation
keymap("n", "<M-h>", "<C-w>h", opts)
keymap("n", "<M-j>", "<C-w>j", opts)
keymap("n", "<M-k>", "<C-w>k", opts)
keymap("n", "<M-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
keymap("i", "jj", "<Esc>", opts)
keymap("i", "<C-c>", "<Esc>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
--
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)

