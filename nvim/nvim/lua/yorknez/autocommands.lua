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

-- Always open NvimTree and at least a buffer
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    local api = require("nvim-tree.api")

    if api.tree.is_tree_buf() then        -- user opened a folder in nvim (the current buffer is nvimtree)
      vim.cmd("vnew")                     -- open an empty buffer in a split window (this keeps nvimtree open)
      api.tree.resize()                   -- resize nvimtree to normal size
    else                                  -- user opened a file in nvim
      api.tree.find_file({ open = true }) -- open and focus the given file
    end
  end,
})

-- Close nvim if NvimTree is the only window left
vim.api.nvim_create_autocmd({ "WinClosed" }, {
  callback = function(data)
    local api = require("nvim-tree.api")

    print(api.tree.is_visible(), vim.fn.winnr("$") == 2, data.match, api.tree.winid())

    -- WinClosed is called before actually closing the window so in order to close nvim we need to have:
    local close_nvim = api.tree.is_visible()              -- nvimtree visible
        and vim.fn.winnr("$") == 2                        -- only 2 windows opened (nvimtree + other window)
        and vim.fn.str2nr(data.match) ~= api.tree.winid() -- the window closed is not nvimtree

    -- so this closes nvim only if there were two windows left, one of which was nvim tree and the other was the closed window
    if close_nvim then
      vim.cmd('qa!') -- exit without saving
    end
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
