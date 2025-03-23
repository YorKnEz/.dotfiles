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
      gitcommit = { wrap = true, spell = true },
      markdown = { wrap = true, spell = true },
    }

    -- Apply settings if they exist for the filetype
    if settings[ft] then
      for key, value in pairs(settings[ft]) do
        vim.opt_local[key] = value
      end
    end
  end,
})

-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
  callback = function()
    vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
  end,
})

-- Remove statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = { "AlphaReady" },
  callback = function()
    vim.cmd([[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]])
  end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function(data)
    -- disable line numbers on the first window (nvimtree)
    vim.opt_local.statuscolumn = "%s"

    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
      return
    end

    -- create a new, empty buffer
    vim.cmd.enew()

    -- wipe the directory buffer
    vim.cmd.bw(data.buf)

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require("nvim-tree.api").tree.open()
  end,
})

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- -- Format current buffer on save
-- vim.api.nvim_create_autocmd({ "BufWrite" }, {
-- 	callback = function()
-- 		vim.lsp.buf.formatting_sync()
-- 	end,
-- })
