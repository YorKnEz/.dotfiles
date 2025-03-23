-- internal stuff (probably most of these can be removed)
vim.opt.backup = false            -- creates a backup file
vim.opt.writebackup = false       -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.undofile = true           -- enable persistent undo
vim.opt.swapfile = false          -- creates a swapfile

vim.opt.fileencoding = "utf-8"    -- the encoding written to a file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.mouse = "a"               -- allow the mouse to be used in neovim

vim.opt.timeoutlen = 1000         -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 300          -- faster completion (4000ms default)

vim.opt.termguicolors = true      -- set term gui colors (most terminals support this)
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications

vim.opt.shortmess:append "c"
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")

-- search
vim.opt.hlsearch = false  -- highlight all matches on previous search pattern
vim.opt.incsearch = true
vim.opt.ignorecase = true -- ignore case in search patterns

-- code
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4   -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4      -- the number of spaces that a tab counts for
vim.opt.wrap = false     -- display lines as one long line

-- folding
vim.opt.foldcolumn = "1"    -- display fold icons on 1 column
vim.opt.foldlevel = 99      -- close folds with a higher level
vim.opt.foldlevelstart = 99 -- set foldlevel to 99 on new buffers
vim.opt.foldenable = true

-- ui
vim.opt.cmdheight = 1       -- more space in the neovim command line for displaying messages
vim.opt.pumheight = 10      -- pop up menu height

vim.opt.conceallevel = 0    -- so that `` is visible in markdown files
vim.opt.completeopt = {     -- mostly just for cmp
    "menuone",              -- always show autocomplete results
    "noselect",             -- force user to select an option
}
vim.opt.cursorline = true   -- highlight the current line
vim.opt.showtabline = 2     -- always show tabs
vim.opt.colorcolumn = "100" -- soft column limit
vim.opt.fillchars = {
    eob = " ",
    -- folding fillchars
    fold = " ",
    foldopen = "",
    foldclose = "",
    foldsep = " ",
}

-- ui - status line
vim.opt.laststatus = 3
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showcmd = false
vim.opt.ruler = true

-- status column
vim.opt.signcolumn = "yes"     -- always show the sign column, otherwise it would shift the text each time
vim.opt.number = true          -- set numbered lines
vim.opt.relativenumber = false -- set relative numbered lines

-- relative line numbers with the current line showing the real line number
-- vim.opt.statuscolumn = '%=%3{v:relnum ? v:relnum : v:lnum} %s%C '
-- human line numbers, it is important that number is set to true
vim.opt.statuscolumn = '%=%3l %s%C '

-- quality of life
vim.opt.smartcase = true   -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true  -- force all horizontal splits to go below current window
vim.opt.splitright = true  -- force all vertical splits to go to the right of current window
vim.opt.scrolloff = 8      -- is one of my fav
vim.opt.sidescrolloff = 8
