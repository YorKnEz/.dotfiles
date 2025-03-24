-- Shorten function name
local keymap = vim.keymap.set

-- Silent keymap option
local opts = function(desc)
  return { silent = true, desc = desc }
end

-- Remap space as leader key
vim.g.mapleader = " "

---- Modes ----
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",



---- Windows ----
-- NvimTree -> also see yorknez.plugins.ui.nvim-tree
keymap("n", "<leader>e", "<cmd>lua require('nvim-tree.api').tree.toggle({ focus = false })<cr>", opts("Toggle NvimTree"))

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts("Navigate left"))
keymap("n", "<C-j>", "<C-w>j", opts("Navigate down"))
keymap("n", "<C-k>", "<C-w>k", opts("Navigate up"))
keymap("n", "<C-l>", "<C-w>l", opts("Navigate right"))

-- Vim-Tmux-Navigator
keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", opts("Tmux: Navigate left"))
keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", opts("Tmux: Navigate down"))
keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", opts("Tmux: Navigate up"))
keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", opts("Tmux: Navigate right"))

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<cr>", opts("Resize window up"))
keymap("n", "<C-Down>", ":resize +2<cr>", opts("Resize window down"))
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts("Resize window left"))
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts("Resize window right"))



---- Buffers ----
keymap("n", "<S-l>", ":bnext<cr>", opts("Buffer: Next buffer"))
keymap("n", "<S-h>", ":bprevious<cr>", opts("Buffer: Prev buffer"))
keymap("n", "<S-q>", "<cmd>Bdelete!<cr>", opts("Buffer: Close buffer"))
keymap("n", "<leader>bv", ":vnew<cr>", opts("Buffer: Split buffer vertically"))
keymap("n", "<leader>bh", ":new<cr>", opts("Buffer: Split buffer horizontally"))



---- Code ----
-- Move text up and down (visual)
keymap("v", "J", ":move .+1<cr>==", opts("Move text down"))
keymap("v", "K", ":move .-2<cr>==", opts("Move text up"))

-- Move text up and down (visual block)
keymap("x", "J", ":move '>+1<cr>gv-gv", opts("Move text down"))
keymap("x", "K", ":move '<-2<cr>gv-gv", opts("Move text up"))

-- Folding
keymap("n", "zR", "<cmd>lua require('ufo').openAllFolds()<cr>", opts("Open all folds"))
keymap("n", "zM", "<cmd>lua require('ufo').closeAllFolds()<cr>", opts("Close all folds"))

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", opts("Toggle linewise comment"))
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
  opts("Toggle linewise comment visual"))

-- LSP -> see yorknez.plugins.lsp.lspconfig

-- Completion -> see yorknez.plugins.lsp.cmp

-- Diagnostics
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts("Diagnostics: Open"))
keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts("Diagnostics: Next"))
keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts("Diagnostics: Prev"))
keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts("Diagnostics: Setloclist"))



---- Misc ----
keymap("i", "jk", "<esc>", opts("Fast enter"))
keymap("v", "p", '"_dP', opts("Better paste"))

-- Stay in indent mode
keymap("v", "<", "<gv", opts("Indent left"))
keymap("v", ">", ">gv", opts("Indent right"))

-- Telescope -> also see yorknez.plugins.telescope
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts("Telescope: Find files"))
keymap("n", "<leader>fs", ":Telescope grep_string<cr>", opts("Telescope: Grep string under cursor"))
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts("Telescope: Live grep"))
keymap("n", "<leader>fb", ":Telescope buffers<cr>", opts("Telescope: Buffers"))
keymap("n", "<leader>fk", ":Telescope keymaps<cr>", opts("Telescope: Keymaps"))
keymap("n", "<leader>fr", ":Telescope resume<cr>", opts("Telescope: Resume last picker"))
