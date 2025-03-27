return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    opts = function()
      return {
        ensure_installed = "all",     -- one of "all" or a list of languages
        ignore_install = { "latex" }, -- List of parsers to ignore installing
        highlight = {
          enable = true,              -- false will disable the whole extension
          disable = { "css" },        -- list of language that will be disabled
        },
        autopairs = {
          enable = true,
        },
        indent = {
          enable = true,
          disable = {
            -- "python", "css"
          }
        },
        enable_autocmd = false,
      }
    end,
    config = function (_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },

}
