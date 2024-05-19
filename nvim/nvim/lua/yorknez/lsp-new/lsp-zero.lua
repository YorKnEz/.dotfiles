-- local lsp_status_ok, lsp = pcall(require, "lsp-zero")
-- if not lsp_status_ok then
--   return
-- end

-- lsp.preset("recommended")

-- lsp.on_attach(function(_, bufnr)
--   lsp.default_keymaps({ buffer = bufnr })
-- end)

-- require("lspconfig").clangd.setup({
--   cmd = {
--     "clangd",
--     "--fallback-style=\"{IndentWidth: 4}\""
--   }
-- })

-- lsp.ensure_installed({ "lua_ls", "clangd", "pylsp" })
--
-- lsp.setup()
