local autocmd = vim.api.nvim_create_autocmd


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
vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'neo-tree filesystem' . tabpagenr() | quit | endif")

-- Fixes Autocomment
autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end,
})


-- Auto toggle cursorline
autocmd({ "InsertEnter" }, {
  callback = function()
    vim.opt.cursorcolumn = false
  end,
})
autocmd({ "InsertLeave" }, {
  callback = function()
    vim.opt.cursorcolumn = true
  end,
})
autocmd({ "InsertEnter" }, {
  callback = function()
    vim.api.nvim_set_hl(0, "CursorLine", { underline = true, sp = "#9aceeb" })
  end,
})

autocmd({ "InsertLeave" }, {
  callback = function()
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#212121" })
  end,
})



-- Autosave
autocmd({ "BufLeave", "FocusLost" }, {
  callback = function()
    local cb = vim.api.nvim_get_current_buf()
    local file = vim.api.nvim_buf_get_option(cb, "modified")
    if file == true then
        vim.cmd("silent! wall")
        print("Auto saved")
    end
  end,
})



-- Toggle Bufferline
autocmd({"CursorHold"}, {
  callback =  function ()
    local tabline_status = vim.opt.showtabline._value
    if tabline_status > 0 then
      vim.keymap.set("n", "<space>tt", "<cmd>set showtabline=0<cr>")  
    else
      vim.keymap.set("n", "<space>tt", "<cmd>set showtabline=2<cr>")  
    end
  end
})



-- Highlight Yanked Text
autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})






