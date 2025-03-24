return {
  -- Automatic greeter for neovim
  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-tree/nvim-tree.lua", -- load nvimtree before alpha so that we can make sure it's closed
    },
    opts = function()
      local status_ok, alpha = pcall(require, "alpha")
      if not status_ok then
        print(alpha)
        return {}
      end

      local dashboard = require "alpha.themes.dashboard"

      -- set sections
      dashboard.section.header.val = {
        [[                               __                ]],
        [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
      }
      dashboard.section.buttons.val = {
        dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <cr>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <cr>"),
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <cr>"),
        dashboard.button("p", " " .. " Find project", ":Telescope projects <cr>"),
        dashboard.button("t", " " .. " Find text", ":Telescope live_grep <cr>"),
        dashboard.button("c", " " .. " Config", ":e ~/.config/nvim/init.lua <cr>"),
        dashboard.button("q", " " .. " Quit", ":qa<cr>"),

      }
      dashboard.section.footer.val = "Powered by yorknez"

      -- set highlight groups
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.footer.opts.hl = "AlphaFooter"

      dashboard.opts.opts.noautocmd = true

      return dashboard
    end,
    config = function(_, dashboard)
      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "⚡ Neovim loaded "
              .. stats.loaded
              .. "/"
              .. stats.count
              .. " plugins in "
              .. ms
              .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })

      -- Remove statusline and tabline when in Alpha
      -- Also do not open nvimtree
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          require("nvim-tree.api").tree.close()
          vim.cmd([[
            set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
            set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
          ]])
        end,
      })
    end,
  },
}
