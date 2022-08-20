local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",


-- Write 
keymap("n", "<C-s>", "<cmd>w!<cr>", opts)
keymap("i", "<C-s>", "<cmd>w!<cr>", opts)


-- Normal --
-- Hop
-- keymap("n", "s", ":HopChar1<cr>", opts)
-- keymap("n", "S", ":HopWord<cr>", opts)

-- Inline text
keymap("n", "<leader>dl", "<cmd>lua vim.diagnostic.config({ virtual_text = true, underline = true})<cr>")
keymap("n", "<leader>dd", "<cmd>lua vim.diagnostic.config({ virtual_text = false, underline = false})<cr>")

--  Comment

keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", opts)
keymap("n", "<leader>c/",  "<cmd>lua require('Comment.api').toggle.blockwise.current()<cr>", opts)
keymap("v", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', opts)
-- keymap('x', '<leader>/', function() vim.api.nvim_feedkeys(esc, 'nx', false) .toggle.linewise(vim.fn.visualmode()) end)
-- keymap("v", "<leader>/b", api.toggle.blockwise.count())

--
vim.cmd([[
  imap <C-l> <Right>
  imap <C-h> <Left>
  nnoremap <ESC> :noh<cr>
  set guicursor+=n-v-c:blinkon1


  nnoremap ; :
  nnoremap : ;
  vnoremap ; :
  vnoremap : ;

]])
--


--
keymap("n", "i", "a", opts)
keymap("n", "I", "A", opts)
--
keymap("n", "a", "i", opts)
keymap("n", "A", "I", opts)
--

keymap("n", "<C-p>", "%", opts)
---
-- keymap("n", "<C-l>", "$a", opts) -- end line
-- keymap("n", "<C-h>", "_i", opts) -- start line
--
-- Split View
keymap("n", "\\", "<cmd>split<cr>", opts) -- Horizontal split
keymap("n", "|", "<cmd>vsplit<cr>", opts) -- Vertical split

-- Close  Buffer
keymap("n", "C", "<cmd>Bdelete<cr>", opts)
--

keymap("n", "<C-q>", "<cmd>q!<cr>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

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
-- Press jj fast to exit insert mode
keymap("i", "jj", "<Esc>", opts)
keymap("i", "<C-p>", "<Esc>pi", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "s", "<cmd>HopWord<cr>", opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- DAP
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
