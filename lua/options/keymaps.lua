local noremap = { noremap = true, silent = true }
local remap = { noremap = false, silent = true }
local silent = { silent = true }

-- Shorten function name
local map = vim.keymap.set

-- leader key
map("", ",", "<Nop>", noremap)
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
map("n", "<C-s>", "<cmd>w!<cr>", noremap)
map("i", "<C-s>", "<cmd>w!<cr>", noremap)

-- Normal --
map("n", "<space>b", "<cmd>NeoTreeFloatToggle<cr>")
-- Hop
map("n", "F", "<CMD>HopWord<CR>", noremap)
map("v", "F", "<CMD>HopWord<CR>", noremap)

-- Inline text
map("n", "<space>dl", "<cmd>lua vim.diagnostic.config({ virtual_text = true, underline = true})<cr>", noremap)
map("n", "<space>dd", "<cmd>lua vim.diagnostic.config({ virtual_text = false, underline = true})<cr>", noremap)

--
map("n", "<ESC>", "<cmd>:noh<cr>")

-- Invert insert keys
-- map("n", "i", "a", noremap)
-- map("n", "I", "A", noremap)
-- map("n", "a", "i", noremap)
-- map("n", "A", "I", noremap)
--

map("n", "<C-p>", "%", noremap)
map("v", "<C-p>", "%", noremap)
---
map("n", "<space>l", "$") -- end line
map("n", "<space>h", "^") -- start line
map("v", "<space>l", "$") -- end line
map("v", "<space>h", "^") -- start line
--
-- Split View
map("n", "|", "<cmd>split<cr>", remap) -- Horizontal split
map("n", "\\", "<cmd>vsplit<cr>", remap) -- Vertical split

-- Buffer
map("n", "C", "<cmd>Bdelete<cr>", silent) -- Close buffer
map("n", "<S-l>", ":BufferLineCycleNext<CR>", silent)
map("n", "<S-h>", ":BufferLineCyclePrev<CR>", silent)
--

-- open new line but stay in normal mode
map('n', 'gO', 'O<esc>')
map('n', 'go', 'o<esc>')

-- Exit
map("n", "<C-q>", "<cmd>q!<cr>", noremap)

-- Better window navigation
map("n", "<M-h>", "<C-w>h", noremap)
map("n", "<M-j>", "<C-w>j", noremap)
map("n", "<M-k>", "<C-w>k", noremap)
map("n", "<M-l>", "<C-w>l", noremap)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", silent)
map("n", "<C-Down>", ":resize +2<CR>", silent)
map("n", "<C-Left>", ":vertical resize -2<CR>", silent)
map("n", "<C-Right>", ":vertical resize +2<CR>", silent)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
map("i", "jj", "<Esc>", silent)
map("i", "<C-v>", "<Esc>pa", noremap)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", noremap)
map("v", ">", ">gv", noremap)

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==", noremap)
map("v", "<A-k>", ":m .-2<CR>==", noremap)
--

-- Clipboard
-- paste selected text without yanking
map("x", "p", '\"_dp', noremap)
map("x", "P", '\"_dP', noremap)
map('n', 'vaa', 'ggVG', noremap) -- select all buffer
map('n', 'yaa', 'ggVGy', noremap) -- copy all buffer
-- cursor position after paste
map('n', 'P', 'gP', noremap)
map('n', 'gP', 'P', noremap)
map('n', 'p', 'p`]', noremap)

map("n", "Q", "<nop>", noremap)

-- Visual Block --
-- Move text up and down
map("x", "K", ":move '<-2<CR>gv-gv", noremap)
map("x", "J", ":move '>+1<CR>gv-gv", noremap)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", noremap)
map("x", "<A-j>", ":move '>+1<CR>gv-gv", noremap)

-- Undotree
map("n", "<F5>", "<cmd>UndotreeToggle<cr>", noremap)
