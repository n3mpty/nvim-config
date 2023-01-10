local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

cmd([[
    set titlestring=%t%f 
    set guicursor+=i:blinkon1

    set t_Co=256
    let &t_Cs = "\e[4:3m"
    let &t_Ce = "\e[4:0m"
]])

--
cmd("colorscheme khaoti")

opt.showmode = false
opt.swapfile = false
opt.wrap = false
--
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.mouse = "a" -- allow the mouse to be used in neovim
--
opt.cmdheight = 1
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
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

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

opt.list = true
-- opt.listchars:append "tab:⇥"
opt.listchars:append "trail:·"
opt.listchars:append "extends:»"
opt.listchars:append "precedes:«"
opt.listchars:append "nbsp:×"

--
opt.inccommand = "split"
