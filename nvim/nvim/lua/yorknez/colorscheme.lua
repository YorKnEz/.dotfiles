require("catppuccin").setup({
  custom_highlights = function(colors)
    return {
      DapUINormal = { link = "Normal" },
      DapUIScope = { fg = colors.blue },
      DapUIType = { fg = colors.yellow },
      DapUIModifiedValue = { fg = colors.teal, bold = true },
      DapUIDecoration = { link = "DapUIScope" },
      DapUIThread = { fg = colors.green },
      DapUIStoppedThread = { link = "DapUIScope" },
      DapUISource = { link = "DapUIType" },
      DapUILineNumber = { link = "DapUIScope" },
      DapUIBreakpointsLine = { link = "DapUIScope" },
      DapUIFloatBorder = { link = "DapUIScope" },
      DapUIWatchesEmpty = { fg = colors.red },
      DapUIWatchesValue = { link = "DapUIThread" },
      DapUIWatchesError = { link = "DapUIWatchesEmpty" },
      DapUIBreakpointsPath = { link = "DapUIScope" },
      DapUIBreakpointsInfo = { link = "DapUIThread" },
      DapUIBreakpointsCurrentLine = { fg = colors.green, bold = true },
      DapUICurrentFrameName = { link = "DapUICurrentFrameName" },
      DapUIBreakpointsDisabledLine = { fg = colors.surface2 },
      DapUIStepOver = { link = "DapUIScope" },
      DapUIStepInto = { link = "DapUIScope" },
      DapUIStepBack = { link = "DapUIScope" },
      DapUIStepOut = { link = "DapUIScope" },
      DapUIStop = { link = "DapUIWatchesEmpty" },
      DapUIPlayPause = { link = "DapUIThread" },
      DapUIRestart = { link = "DapUIThread" },
      DapUIUnavailable = { link = "DapUIBreakpointsDisabledLine" },
      DapUIWinSelect = { link = "DapUIModifiedValue" },
      DapUINormalNC = { link = "Normal" },
      DapUIPlayPauseNC = { link = "DapUIThread" },
      DapUIRestartNC = { link = "DapUIThread" },
      DapUIStopNC = { link = "DapUIWatchesEmpty" },
      DapUIUnavailableNC = { link = "DapUIBreakpointsDisabledLine" },
      DapUIStepOverNC = { link = "DapUIScope" },
      DapUIStepIntoNC = { link = "DapUIScope" },
      DapUIStepBackNC = { link = "DapUIScope" },
      DapUIStepOutNC = { link = "DapUIScope" },
    }
  end,
})

function ColorMyPencils(color)
  color = color or "catppuccin-mocha"
  vim.cmd.colorscheme(color)

  --[[ vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) ]]
  --[[ vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) ]]
end

ColorMyPencils()
