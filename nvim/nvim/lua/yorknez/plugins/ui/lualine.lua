return {
  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
      local hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end

      -- local diagnostics = {
      --   "diagnostics",
      --   sources = { "nvim_diagnostic" },
      --   sections = { "error", "warn" },
      --   symbols = { error = " ", warn = " " },
      --   colored = false,
      --   always_visible = true,
      -- }

      -- local diff = {
      --   "diff",
      --   colored = false,
      --   symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
      --   cond = hide_in_width,
      -- }

      local filetype = {
        "filetype",
        icons_enabled = false,
      }

      local location = {
        "location",
        padding = 0,
      }

      local spaces = function()
        return "spaces: " .. vim.api.nvim_get_option_value("shiftwidth", { buf = 0 })
      end

      local plugin_updates = {
        require("lazy.status").updates,
        cond = require("lazy.status").has_updates,
        on_click = function() vim.cmd("Lazy") end,
      }

      return {
        options = {
          globalstatus = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = " " },
          disabled_filetypes = { "alpha", "dashboard" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { plugin_updates, "lsp_status" },
          lualine_x = { spaces, "encoding", filetype },
          lualine_y = { location },
          lualine_z = { "progress" },
        },
      }
    end
  },
}
