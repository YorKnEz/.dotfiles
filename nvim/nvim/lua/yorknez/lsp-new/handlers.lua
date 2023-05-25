local keymap = vim.keymap.set

local function global_opts(desc)
  return { desc = "LSP: " .. desc }
end

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", global_opts("Diagnostics"))
keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", global_opts("Next diagnostic"))
keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", global_opts("Prev diagnostic"))
keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", global_opts("Setloclist"))

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

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

    --[[ vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts) ]]
    --[[ vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts) ]]
    --[[ vim.keymap.set('n', '<space>wl', function() ]]
    --[[   print(vim.inspect(vim.lsp.buf.list_workspace_folders())) ]]
    --[[ end, opts) ]]
    keymap("n", "<leader>ld", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts("Type definition"))
    keymap("n", "<leader>lf", function()
      vim.lsp.buf.format { async = true }
    end, opts("Format"))
    keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts("LspInfo"))
    keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts("LspInstallInfo"))
    keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts("Code actions"))
    keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts("Rename"))
    keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts("Signature help"))
  end,
})
