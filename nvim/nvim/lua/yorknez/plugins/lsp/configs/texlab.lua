return {
  settings = {
    texlab = {
      build = {
        executable = "latexmk",
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
        onSave = true,
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
