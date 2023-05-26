local lsp_status_ok, lsp = pcall(require, "lsp-zero")
if not lsp_status_ok then
  return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

lsp.preset("recommended")

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)


-- capabilities
local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities = vim.tbl_deep_extend(
  "force",
  lsp_defaults.capabilities,
  require("cmp_nvim_lsp").default_capabilities()
)


lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
