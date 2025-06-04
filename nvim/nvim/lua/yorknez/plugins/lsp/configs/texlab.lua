return {
  settings = {
    texlab = {
      build = {
        executable = "",
        args = {},
        onSave = false,
        forwardSearchAfter = false,
      },
      forwardSearch = {
        executable = "zathura", -- or okular, evince, sumatraPDF, etc.
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
      auxDirectory = ".",
      latexFormatter = "latexindent",
    }
  }
}
