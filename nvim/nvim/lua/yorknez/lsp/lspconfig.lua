local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

-- capabilities
local lsp_defaults = lspconfig.util.default_config

local fold_capabilities = {
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
  }
}

lsp_defaults.capabilities = vim.tbl_deep_extend(
  "force",
  lsp_defaults.capabilities,
  require("cmp_nvim_lsp").default_capabilities(),
  fold_capabilities
)

local language_servers = lspconfig.util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
  -- default options for all lsps
  local opts = {
    capabilities = lsp_defaults.capabilities
  }

  -- extend the default options using custom options from configs folder
  local require_ok, settings = pcall(require, "yorknez.lsp.configs." .. ls)
  if require_ok then
    opts = vim.tbl_deep_extend("force", settings, opts)
  end

  -- add the options to the lsp
  lspconfig[ls].setup(opts)
end


-- set keymaps
local keymap = vim.keymap.set
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {

  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions

    local function opts(desc)
      return { desc = "LSP: " .. desc, buffer = ev.buf }
    end

    keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts("Declaration"))
    keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts("Definition"))
    keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts("Hover"))
    keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts("Implementation"))
    keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts("References"))

    --[[ vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts) ]]
    --[[ vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts) ]]
    --[[ vim.keymap.set("n", "<space>wl", function() ]]
    --[[   print(vim.inspect(vim.lsp.buf.list_workspace_folders())) ]]
    --[[ end, opts) ]]
    keymap("n", "<leader>ld", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts("Type definition"))
    keymap("n", "<leader>lf", function()
      vim.lsp.buf.format({ async = true })
    end, opts("Format"))
    keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts("LspInfo"))
    keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts("LspInstallInfo"))
    keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts("Code actions"))
    keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts("Rename"))
    keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts("Signature help"))
  end,
})
