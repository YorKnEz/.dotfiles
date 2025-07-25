return {
  -- LaTeX
  {
    "lervag/vimtex",
    tag = "v2.16",
    init = function()
      -- General
      vim.g.vimtex_quickfix_mode = 2 -- Disable automatic quickfix window

      -- Ignore auxiliary files in Neovim's built-in file explorer
      vim.g.vimtex_index_ignore_patterns = {
        "*.aux", "*.bbl", "*.blg", "*.fls", "*.fdb_latexmk",
        "*.synctex.gz", "*.toc", "*.out", "*.log"
      }

      -- View
      vim.g.vimtex_view_method = "zathura"
      -- SyncTeX for forward/backward search
      vim.g.vimtex_view_general_options = "--synctex-forward @line:@col:@tex"

      -- Compiler
      vim.g.vimtex_compiler_method = "latexmk"
    end
  },
}
