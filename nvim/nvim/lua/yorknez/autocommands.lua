-- Function to set shiftwidth based on file type
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    local ft = vim.bo.filetype
    if ft == "lua" or ft == "typescriptreact" then
      vim.opt.shiftwidth = 2
      vim.opt.tabstop = 2
    elseif ft == "yaml" then
      vim.opt.shiftwidth = 4
      vim.opt.tabstop = 4
    end
  end,
})

-- Function to set colorcolumn based on file type
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    local ft = vim.bo.filetype
    if ft == "asm" then
      vim.opt.colorcolumn = "80"
    elseif ft == "python" then
      vim.opt.colorcolumn = "120"
    else
      vim.opt.colorcolumn = "100" -- default
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

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Automatically close tab/vim when nvim-tree is the last window in the tab
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*" },
  callback = function()
    if vim.fn.winnr('$') == 1 and vim.fn.bufname() == 'NvimTree_' .. vim.fn.tabpagenr() then
      vim.cmd('quit')
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*" },
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local win = vim.api.nvim_get_current_win()
    local file_type = vim.api.nvim_buf_get_option(buf, "filetype")

    if file_type == "NvimTree" then
      vim.api.nvim_win_set_option(win, "statuscolumn", "%s")
    end
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
