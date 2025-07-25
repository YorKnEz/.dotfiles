-- Function to set some options based on filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    local ft = vim.bo.filetype

    -- Define settings for specific filetypes
    local settings = {
      lua = { shiftwidth = 2, tabstop = 2 },
      typescriptreact = { shiftwidth = 2, tabstop = 2 },
      javascript = { shiftwidth = 2, tabstop = 2 },
      javascriptreact = { shiftwidth = 2, tabstop = 2 },
      yaml = { shiftwidth = 4, tabstop = 4 },
      asm = { colorcolumn = "80" },
      python = { colorcolumn = "120" },
      gitcommit = { wrap = true, breakindent = true, spell = true },
      markdown = { wrap = true, breakindent = true, spell = true },
      tex = { wrap = true, breakindent = true, spell = true },
    }

    -- Apply settings if they exist for the filetype
    if settings[ft] then
      for key, value in pairs(settings[ft]) do
        vim.opt_local[key] = value
      end
    end
  end,
})

-- Map j and k to gj and gk for tex/text/md files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "markdown", "text" },
  callback = function()
    local k = require("yorknez.keymaps");
    k.keymap("n", "j", "gj", k.opts("Remap j to gj"));
    k.keymap("n", "k", "gk", k.opts("Remap k to gk"));
  end,
})

-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
  callback = function()
    vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
  end,
})

-- Fixes Autocomment
vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})
