local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "yorknez.lsp.lsp"
require("yorknez.lsp.handlers").setup()
--[[ require "yorknez.lsp.null-ls" ]]
