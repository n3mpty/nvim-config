local autocmd = vim.api.nvim_create_autocmd

-- Install Packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end


-- Use 'q' to quit from common plugins
autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
  callback = function()
    vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR> 
      nnoremap <silent> <buffer> <esc> :close<CR> 
      set nobuflisted 
    ]])
  end,
})

-- Remove statusline and tabline when in Alpha
autocmd({ "User" }, {
  pattern = { "AlphaReady" },
  callback = function()
    vim.cmd([[
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]])
  end,
})

autocmd({ "BufEnter" }, {
  pattern = { "" },
  callback = function()
    local get_project_dir = function()
      local cwd = vim.fn.getcwd()
      local project_dir = vim.split(cwd, "/")
      local project_name = project_dir[#project_dir]
      return project_name
    end

    vim.opt.titlestring = get_project_dir() .. " - nvim"
  end,
})

autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")
vim.cmd( "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'neo-tree filesystem' . tabpagenr() | quit | endif")

-- Fixes Autocomment
autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end,
})

-- Don't auto comment new lines
autocmd({ "BufEnter" }, {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- Highlight Yanked Text
autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

local packer_sync_group = vim.api.nvim_create_augroup("PACKER", { clear = true })
autocmd("BufWritePost", {
  pattern = "plugins.lua",
  group = packer_sync_group,
  command = 'source <afile> | PackerSync',
})
