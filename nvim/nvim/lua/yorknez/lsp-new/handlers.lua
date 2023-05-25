local keymap = vim.keymap.set

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>")
keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>")
keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>")

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { buffer = ev.buf, desc = "Declaration" })
    keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

    --[[ vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts) ]]
    --[[ vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts) ]]
    --[[ vim.keymap.set('n', '<space>wl', function() ]]
    --[[   print(vim.inspect(vim.lsp.buf.list_workspace_folders())) ]]
    --[[ end, opts) ]]
    keymap("n", "<leader>ld", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
    keymap("n", "<leader>lf", function()
      vim.lsp.buf.format { async = true }
    end, opts)

    keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
    keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
    keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  end,
})
