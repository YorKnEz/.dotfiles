return {
  -- Buffer line above the screen
  {
    "akinsho/bufferline.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
      return {
        options = {
          close_command = "Bdelete! %d",       -- can be a string | function, see "Mouse actions"
          right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
          offsets = { { filetype = "NvimTree", text = "", separator = true } },
          separator_style = "thin",            -- | "thick" | "thin" | { 'any', 'any' },
        },
        highlights = {
          fill = {
            fg = { attribute = "fg", highlight = "TabLine" },
            bg = { attribute = "bg", highlight = "TabLine" },
          },
          background = {
            fg = { attribute = "fg", highlight = "TabLine" },
            bg = { attribute = "bg", highlight = "TabLine" },
          },

          buffer_visible = {
            fg = { attribute = "fg", highlight = "TabLine" },
            bg = { attribute = "bg", highlight = "TabLine" },
          },

          close_button = {
            fg = { attribute = "fg", highlight = "TabLine" },
            bg = { attribute = "bg", highlight = "TabLine" },
          },
          close_button_visible = {
            fg = { attribute = "fg", highlight = "TabLine" },
            bg = { attribute = "bg", highlight = "TabLine" },
          },

          tab_selected = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
          },
          tab = {
            fg = { attribute = "fg", highlight = "TabLine" },
            bg = { attribute = "bg", highlight = "TabLine" },
          },
          tab_close = {
            fg = { attribute = "fg", highlight = "TabLineSel" },
            bg = { attribute = "bg", highlight = "Normal" },
          },

          duplicate_selected = {
            fg = { attribute = "fg", highlight = "TabLineSel" },
            bg = { attribute = "bg", highlight = "TabLineSel" },
            italic = true,
          },
          duplicate_visible = {
            fg = { attribute = "fg", highlight = "TabLine" },
            bg = { attribute = "bg", highlight = "TabLine" },
            italic = true,
          },
          duplicate = {
            fg = { attribute = "fg", highlight = "TabLine" },
            bg = { attribute = "bg", highlight = "TabLine" },
            italic = true,
          },

          modified = {
            fg = { attribute = "fg", highlight = "TabLine" },
            bg = { attribute = "bg", highlight = "TabLine" },
          },
          modified_selected = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
          },
          modified_visible = {
            fg = { attribute = "fg", highlight = "TabLine" },
            bg = { attribute = "bg", highlight = "TabLine" },
          },

          separator = {
            fg = { attribute = "bg", highlight = "TabLine" },
            bg = { attribute = "bg", highlight = "TabLine" },
          },
          separator_selected = {
            fg = { attribute = "bg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
          },
          indicator_selected = {
            fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
            bg = { attribute = "bg", highlight = "Normal" },
          },
        },
      }
    end
  },
}
