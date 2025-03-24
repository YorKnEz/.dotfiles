return {
  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- Completion sources
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-signature-help", -- show signature help while completing function
      "saadparwaiz1/cmp_luasnip",

      -- Snippets
      "L3MON4D3/LuaSnip", -- snippet engine
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if not cmp_status_ok then
        print(cmp)
        return
      end

      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then
        print(luasnip)
        return
      end

      local kind_icons = {
        Text = "",
        Method = "m",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }

      -- Load luasnip snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Autopairs integration
      cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())

      cmp.setup({
        preselect = 'item',
        completion = {
          completeopt = "menu,menuone,noinsert"
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            vim_item.kind = kind_icons[vim_item.kind]
            vim_item.menu = ({
              nvim_lsp = 'λ',
              buffer = 'Ω',
              path = '🖫',
              nvim_lua = 'Π',
              emoji = "",
              luasnip = '⋗',
            })[entry.source.name]
            return vim_item
          end,
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ['<C-j>'] = cmp.mapping.scroll_docs(4),
          ['<C-k>'] = cmp.mapping.scroll_docs(-4),

          -- Super tab
          ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1
            local cursor_on_whitespace = col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')

            if cmp.visible() then                            -- select next item if completion menu is visible
              cmp.select_next_item({ behavior = 'select' })
            elseif luasnip.expand_or_locally_jumpable() then -- expand the current snippet or jumps to the next snippet placeholder
              luasnip.expand_or_jump()
            elseif cursor_on_whitespace then                 -- if the cursor is on whitespace, act as a normal tab key
              fallback()
            else                                             -- display completion menu if we are in the middle of a word
              cmp.complete()
            end
          end, { 'i', 's' }),

          -- Super shift tab
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then                    -- select prev item if completion menu is visible
              cmp.select_prev_item({ behavior = 'select' })
            elseif luasnip.locally_jumpable(-1) then -- jump to the previous snippet placeholder
              luasnip.jump(-1)
            else                                     -- act as a normal shift tab combo
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = 'nvim_lsp_signature_help' },
          { name = "buffer" },
          { name = "path" },
          { name = "nvim_lua" },
          { name = "luasnip" },
        },
        experimental = {
          ghost_text = true,
        },
      })
    end
  },
}
