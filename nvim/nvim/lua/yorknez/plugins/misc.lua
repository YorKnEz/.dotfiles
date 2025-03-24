return {
  { "moll/vim-bbye" }, -- Better :bdelete

  -- Integration with tmux
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
  },

  {
    "ahmedkhalf/project.nvim",
    opts = function()
      return {
        -- detection_methods = { "lsp", "pattern" }, NOTE: lsp detection will get annoying with multiple langs in one project
        detection_methods = { "pattern" },

        -- patterns used to detect root dir, when **"pattern"** is in detection_methods
        patterns = { ".git", "Makefile", "package.json" },
      }
    end,
    config = function(_, opts)
      require("project_nvim").setup(opts)
    end
  },
}
