local lsp_status_ok, lsp = pcall(require, "lsp-zero")
if not lsp_status_ok then
  return
end

lsp.preset('recommended')

local servers = {
  "lua_ls",
  "cssls",
  "html",
  "tsserver",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
}

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("yorknez.lsp.handlers").on_attach,
    capabilities = require("yorknez.lsp.handlers").capabilities,
  }

  if server == "lua_ls" then
    local lua_opts = require "yorknez.lsp.settings.lua_ls"
    opts = vim.tbl_deep_extend("force", lua_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require "yorknez.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  lsp.configure(server, opts)
end

lsp.setup()
