local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git", "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim" }                -- Have packer manage itself
  use { "windwp/nvim-autopairs" }                 -- Autopairs, integrates with both cmp and treesitter
  use { "akinsho/bufferline.nvim" }               -- Buffer line above the screen
  use { "moll/vim-bbye" }                         -- Allows deleting buffers and other stuff
  use { "nvim-lualine/lualine.nvim" }             -- Status line
  use { "akinsho/toggleterm.nvim" }               -- Integrated terminal
  use { "ahmedkhalf/project.nvim" }               -- Project management (?)
  use { "lewis6991/impatient.nvim" }              -- Speeds up neovim startup times
  use { "lukas-reineke/indent-blankline.nvim" }   -- Gives the "| " for each indentation
  use { "goolord/alpha-nvim" }                    -- Automatic greeter for neovim
  use { "MunifTanjim/prettier.nvim" }
  use { "christoomey/vim-tmux-navigator" }        -- Integration with tmux

  -- LSP
  use({
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},         -- Required
		  {'hrsh7th/cmp-nvim-lsp'},     -- Required
		  {'hrsh7th/cmp-buffer'},       -- Optional
		  {'hrsh7th/cmp-path'},         -- Optional
		  {'saadparwaiz1/cmp_luasnip'}, -- Optional
		  {'hrsh7th/cmp-nvim-lua'},     -- Optional

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},             -- Required
		  {'rafamadriz/friendly-snippets'}, -- Optional
	  }
  })

  --[[ -- LSP ]]
  --[[ use { "neovim/nvim-lspconfig" } -- enable LSP ]]
  --[[ use { "williamboman/nvim-lsp-installer" } -- simple to use language server installer ]]
  --[[ use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters ]]
  --[[]]
  --[[ -- cmp plugins ]]
  --[[ use { "hrsh7th/nvim-cmp" } -- The completion plugin ]]
  --[[ use { "hrsh7th/cmp-buffer" } -- buffer completions ]]
  --[[ use { "hrsh7th/cmp-path" } -- path completions ]]
  --[[ use { "saadparwaiz1/cmp_luasnip" } -- snippet completions ]]
  --[[ use { "hrsh7th/cmp-nvim-lsp" } ]]
  --[[ use { "hrsh7th/cmp-nvim-lua" } ]]
  --[[]]
  --[[ -- snippets ]]
  --[[ use { "L3MON4D3/LuaSnip" } --snippet engine ]]
  --[[ use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use ]]

  -- Telescope
  use({
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  })

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter" }

  -- NvimTree
  use { "nvim-tree/nvim-tree.lua" }
  use { "nvim-tree/nvim-web-devicons" }

  -- Colorschemes
  use { "ellisonleao/gruvbox.nvim" }

  -- Comments
  use { "numToStr/Comment.nvim" }
  use { "JoosepAlviste/nvim-ts-context-commentstring" }

  -- Git
  use { "lewis6991/gitsigns.nvim" }

  -- DAP
  use { "mfussenegger/nvim-dap", commit = "014ebd53612cfd42ac8c131e6cec7c194572f21d" }
  use { "rcarriga/nvim-dap-ui", commit = "d76d6594374fb54abf2d94d6a320f3fd6e9bb2f7" }
  use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
