return {
  -- Misc
  { "akinsho/bufferline.nvim" },                                                             -- Buffer line above the screen
  { "moll/vim-bbye" },                                                                       -- Allows deleting buffers and other stuff
  { "nvim-lualine/lualine.nvim" },                                                           -- Status line
  { "akinsho/toggleterm.nvim" },                                                             -- Integrated terminal
  { "lukas-reineke/indent-blankline.nvim" },                                                 -- Gives the "| " for each indentation
  { "goolord/alpha-nvim" },                                                                  -- Automatic greeter for neovim
  { "christoomey/vim-tmux-navigator" },                                                      -- Integration with tmux
  { "windwp/nvim-autopairs" },                                                               -- Autopairs, integrates with both cmp and treesitter
  { "lewis6991/impatient.nvim" },                                                            -- Speeds up neovim startup times
  { "kevinhwang91/nvim-ufo",              dependencies = { "kevinhwang91/promise-async" } }, -- Folding
  { "ahmedkhalf/project.nvim" },                                                             -- Project management (?)
  { "MunifTanjim/prettier.nvim" },                                                           -- Formatter

  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      "neovim/nvim-lspconfig",             -- Required
      "williamboman/mason.nvim",           -- Optional
      "williamboman/mason-lspconfig.nvim", -- Optional

      -- Autocompletion
      "hrsh7th/nvim-cmp",         -- Required
      "hrsh7th/cmp-nvim-lsp",     -- Required
      "hrsh7th/cmp-buffer",       -- Optional
      "hrsh7th/cmp-path",         -- Optional
      "saadparwaiz1/cmp_luasnip", -- Optional
      "hrsh7th/cmp-nvim-lua",     -- Optional

      -- Snippets
      "L3MON4D3/LuaSnip",             -- Required
      "rafamadriz/friendly-snippets", -- Optional
    }
  },
  { "jose-elias-alvarez/null-ls.nvim" },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.3",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  },

  -- NvimTree
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" },

  -- Colorschemes
  { "catppuccin/nvim",                            name = "catppuccin" },

  -- Comments
  { "numToStr/Comment.nvim" },
  { "JoosepAlviste/nvim-ts-context-commentstring" },

  -- Git
  { "lewis6991/gitsigns.nvim" },

  -- Debugging
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui" },
  { "theHamsta/nvim-dap-virtual-text" },

  -- LaTeX
  { "lervag/vimtex",                              tag = "v2.16" },
}
