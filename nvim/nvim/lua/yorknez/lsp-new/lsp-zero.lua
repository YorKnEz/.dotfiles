local lsp_status_ok, lsp = pcall(require, "lsp-zero")
if not lsp_status_ok then
  return
end

lsp.preset("recommended")

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.ensure_installed({ "lua_ls", "clangd", "pyright" })

lsp.setup()
