return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      -- required
      "nvim-lua/plenary.nvim",
      -- suggested
      "BurntSushi/ripgrep",
      -- optional
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = function()
      local status_ok, telescope = pcall(require, "telescope")
      if not status_ok then
        print(telescope)
        return {}
      end

      local actions = require "telescope.actions"

      return {
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "truncate" },
          mappings = {
            i = {
              ["<Down>"] = actions.cycle_history_next,
              ["<Up>"] = actions.cycle_history_prev,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },

        },
        -- telescope.builtin
        pickers = {
          find_files = { theme = "ivy" },
          grep_string = {
            path_display = "hidden",
            theme = "dropdown",
            use_regex = true,
            disable_coordinates = true,
          },
          live_grep = { theme = "dropdown" },
          buffers = { theme = "dropdown" },
          keymaps = { theme = "dropdown", show_plug = false, },
        }
      }
    end,
    config = function(_, opts)
      require("telescope").setup(opts)

      -- enable project extension for project plugin
      require("telescope").load_extension("projects")
    end
  },
}
