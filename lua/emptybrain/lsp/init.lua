local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "emptybrain.lsp.config"
require("emptybrain.lsp.handlers").setup()
require "emptybrain.lsp.null-ls"
