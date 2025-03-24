return {
  -- Autopairs, integrates with both cmp and treesitter
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = function()
      return {
        check_ts = true, -- treesitter integration
        disable_filetype = { "TelescopePrompt" },
      }
    end
  },

  -- Folding
  { "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" }, opts = {}, },

  -- Comments
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = function()
      return {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end
  },

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      return {
        signs = {
          add          = { text = "▎" },
          change       = { text = "▎" },
          delete       = { text = "" },
          topdelete    = { text = "" },
          changedelete = { text = "▎" },
          untracked    = { text = "▎" },
        },
      }
    end
  },
}
