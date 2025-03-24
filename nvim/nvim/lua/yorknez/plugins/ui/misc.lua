return {
  -- Colorschemes
  {
    "catppuccin/nvim",
    name = "catppuccin",
    init = function()
      vim.cmd.colorscheme("catppuccin-mocha")

      -- Use same color for pop-up windows as for normal windows
      vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    end,
  },

  -- Gives the "| " for each indentation
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = function()
      return
      {
        indent = {
          char = "▏",
        },
        whitespace = {
          remove_blankline_trail = false,
        },
        -- show_trailing_blankline_indent = false,
        -- show_first_indent_level = true,
        scope = {
          enabled = true,
          show_start = false,
          show_end = false,
        },
        exclude = {
          filetypes = {
            "NvimTree",
          },
        },
      }
    end
  },
}
