-- NOTE: Use "yorknez.plugins.lsp.configs" to manually configure a language server.

return {
  -- Packet manager for LSP, DAP, Linting, Formatting
  {
    "mason-org/mason.nvim",
    lazy = false,
    opts = {},
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "mason-org/mason.nvim" },
      -- FIXME: remove pin after upgrading to v0.11 (next update requires neovim v0.11)
      { "mason-org/mason-lspconfig.nvim", pin = true },
    },
    init = function()
      -- Reserve a space in the gutter
      -- This will avoid an annoying layout shift in the screen
      vim.opt.signcolumn = "yes"
    end,
    config = function()
      local cmp_status_ok, lspconfig = pcall(require, "lspconfig")
      if not cmp_status_ok then
        print(lspconfig)
        return
      end

      -- Get a reference to the default capabilities
      local lsp_defaults = lspconfig.util.default_config

      -- Modify the default capabilities for all language servers
      -- This should be executed before you configure any language server
      lsp_defaults.capabilities = vim.tbl_deep_extend(
        "force",
        lsp_defaults.capabilities,

        -- Add completion capabilities (nvim-cmp)
        require("cmp_nvim_lsp").default_capabilities(),

        -- Add folding capabilities (nvim-ufo)
        {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true,
            },
          },
        }
      )

      -- LspAttach is where you enable features that only work if there is a language server
      -- active in the file
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
          -- TODO: move to keymaps
          local keymap = vim.keymap.set
          local function opts(desc)
            return { desc = "LSP: " .. desc, buffer = event.buf }
          end

          keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts("Hover"))
          keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts("Definition"))
          keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts("Declaration"))
          keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts("Implementation"))
          keymap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts("Type definition"))
          keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts("References"))
          keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts("Signature help"))
          keymap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts("Rename"))
          -- keymap({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts("Format"))
          keymap("n", "<F3>", "<cmd>lua require('conform').format({ async = true })<cr>", opts("LSP: Format"))
          keymap("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts("Code actions"))
        end,
      })

      -- Configure diagnostics
      -- Diagnostics are turned on by default, this just changes some visual things
      vim.diagnostic.config({
        -- underline = true, -- by default, diagnostics are underlined
        -- virtual_text = false, -- by default, diagnostics are shown inline, disable this to turn it off
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "󰌵",
            [vim.diagnostic.severity.INFO] = "",
          },
        },
        float = {
          header = "",
          prefix = "",
          -- suffix = "",
          source = true, -- always show diagnostic sources
          border = "single",
        },
        update_in_insert = true,
        severity_sort = true,
      })

      -- Configure window aspect for hover and signature help
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "single"
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "single",
      })

      -- Setup mason for automatic installation of language servers
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "pyright" },
        handlers = {
          -- This first function is the "default handler"
          -- It applies to every language server without a "custom handler"
          function(server_name)
            -- Extend the default options using custom options from configs folder
            local require_ok, opts = pcall(require, "yorknez.plugins.lsp.configs." .. server_name)
            if not require_ok then
              opts = {}
            end
            lspconfig[server_name].setup(opts)
          end,
        }
      })
    end
  }
}
