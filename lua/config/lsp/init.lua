local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
  return
end



lsp.preset("recommended")
lsp.ensure_installed({
  "gopls",
  "cssls",
  "clangd",
  "dockerls",
  "eslint",
  "html",
  "jsonls",
  "marksman",
  "sumneko_lua",
  "rust_analyzer",
  "pyright",
  "jedi_language_server",
  "yamlls",
  "bashls",
  "taplo",
  "tsserver",
  "elixirls",
})

lsp.on_attach(function(client, bufnr)
  vim.b.lsp_attached = true
  local opts = { noremap = true, silent = true }
  local map = vim.api.nvim_buf_set_keymap
  map(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
  map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  map(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  map(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  map(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float({border = 'single'})<CR>", opts)
  map(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({async=true})<cr>", opts)
  map(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  map(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
  map(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
  map(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  map(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  map(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)



  -- vim.api.nvim_create_autocmd("CursorHold", {
  --     buffer = bufnr,
  --     callback = function()
  --         local opts = {
  --             focusable = false,
  --             close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
  --             border = "single",
  --             source = "always",
  --             prefix = " ",
  --             scope = "cursor",
  --         }
  --         vim.diagnostic.open_float(nil, opts)
  --     end,
  -- })

end)




lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = false,
  call_servers = 'local',
  sign_icons = {
    error = '',
    warn = '▲',
    hint = '',
    info = '',
  }
})



require("rust-tools").setup({
  tools = {
    inlay_hints = {
      -- automatically set inlay hints (type hints)
      -- default: true
      auto = true,

      -- Only show inlay hints for the current line
      only_current_line = false,

      -- whether to show parameter hints with the inlay hints or not
      -- default: true
      show_parameter_hints = true,

      -- prefix for parameter hints
      -- default: "<-"
      parameter_hints_prefix = "<~~~ ",

      -- prefix for all the other hints (type, chaining)
      -- default: "=>"
      other_hints_prefix = " ~~~> ",

      -- whether to align to the lenght of the longest line in the file
      max_len_align = false,

      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,

      -- whether to align to the extreme right or not
      right_align = false,

      -- padding from the right if right_align is true
      right_align_padding = 7,

      -- The color of the hints
      highlight = "Comment",
    },
  },
  server = lsp.build_options("rust_analyzer", {})
})

lsp.configure("pyright", {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = false,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        autoImportCompletions = false,
        logLevel = "Information",
      }
    },
    pyright = {
      typeCheckingMode = "basic",
      disableLanguageServices = true,
      disableOrganizeImports = true,
    }
  }
})

lsp.setup()

vim.diagnostic.config({
  virtual_text = {
    enabled = true,
    spacing = "15",
    prefix = "▰",
  },
  signs = true,
  update_in_insert = false,
  underline = false,
  severity_sort = true,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
})


local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

local null_opts = lsp.build_options("null-ls", {})


local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local hover = null_ls.builtins.hover

null_ls.setup({
  on_attach = function(client, bufnr)
    null_opts.on_attach(client, bufnr)
  end,
  sources = {
    null_ls.builtins.formatting.black.with({ extra_args = { "--fast", "--line-lenght=200" } }),
    -- diagnostics.pylint.with( { filetypes = { "python" }}),
    formatting.stylua,
    formatting.rustfmt,
  },
})
