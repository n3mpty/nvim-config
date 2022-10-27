local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

cmd([[
  set titlestring=%t%f 
  set guicursor+=i:blinkon1
]])


--
opt.showmode = false
opt.swapfile = false
opt.wrap = false
--
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.mouse = "a" -- allow the mouse to be used in neovim
--
opt.cmdheight = 2
--
opt.conceallevel = 0 -- so that `` is visible in markdown files
--
opt.fileencoding = "utf-8"
--
opt.hlsearch = true -- highlight all matches on previous search pattern
--
opt.cursorline = true
opt.cursorcolumn = true
opt.scrolloff = 5
opt.sidescrolloff = 5
opt.laststatus = 3 -- Global statusline
--
opt.signcolumn = "yes"
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.termguicolors = true
opt.undofile = true
--

-- indenting
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

--
opt.ignorecase = true
opt.smartcase = true
--
opt.fillchars = { eob = " " }
--
opt.title = true -- window title

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

--
opt.timeoutlen = 700
opt.updatetime = 300
--
opt.shortmess:append("c")
opt.whichwrap:append("<,>,[,],h,l")
opt.iskeyword:append("-")

opt.list = false
