-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = function(desc)
  return { silent = true, desc = desc }
end

-- Remap space as leader key 
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts("Navigate left"))
keymap("n", "<C-j>", "<C-w>j", opts("Navigate down"))
keymap("n", "<C-k>", "<C-w>k", opts("Navigate up"))
keymap("n", "<C-l>", "<C-w>l", opts("Navigate right"))

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<cr>", opts("Resize window up"))
keymap("n", "<C-Down>", ":resize +2<cr>", opts("Resize window down"))
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts("Resize window left"))
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts("Resize window right"))

-- Buffers
keymap("n", "<S-l>", ":bnext<cr>", opts("Buffer: Next buffer"))
keymap("n", "<S-h>", ":bprevious<cr>", opts("Buffer: Prev buffer"))
keymap("n", "<S-f>", ":ls<cr>:buffer<Space>", opts("Buffer: List buffers"))
keymap("n", "<S-q>", "<cmd>Bdelete!<cr>", opts("Buffer: Close buffer"))
keymap("n", "<leader>bv", ":vnew<cr>", opts("Buffer: Split buffer vertically"))
keymap("n", "<leader>bh", ":new<cr>", opts("Buffer: Split buffer horizontally"))
-- Format
keymap("n", "<leader>bc", "<cmd>Prettier<cr>", opts("Buffer: Prettier"))

-- Insert --
keymap("i", "jk", "<ESC>", opts("Fast enter"))

-- Visual --
keymap("v", "p", '"_dP', opts("Better paste"))

-- Stay in indent mode
keymap("v", "<", "<gv", opts("Indent left"))
keymap("v", ">", ">gv", opts("Indent right"))

-- Move text up and down
keymap("v", "J", ":move .+1<cr>==", opts("Move text down"))
keymap("v", "K", ":move .-2<cr>==", opts("Move text up"))

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<cr>gv-gv", opts("Move text down"))
keymap("x", "K", ":move '<-2<cr>gv-gv", opts("Move text up"))

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts("Toggle NvimTree"))

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts("Telescope: Find files"))
keymap("n", "<leader>ft", ":Telescope live_grep<cr>", opts("Telescope: Live grep"))
keymap("n", "<leader>fp", ":Telescope projects<cr>", opts("Telescope: Projects"))
keymap("n", "<leader>fb", ":Telescope buffers<cr>", opts("Telescope: Buffers"))
keymap("n", "<leader>fk", ":Telescope keymaps<cr>", opts("Telescope: Keymaps"))
keymap("n", "<leader>fr", ":Telescope resume<cr>", opts("Telescope: Resume last picker"))

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", opts("Toggle linewise comment"))
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
  opts("Toggle linewise comment visual"))

-- Vim-Tmux-Navigator
keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", opts("Tmux: Navigate left"))
keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", opts("Tmux: Navigate down"))
keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", opts("Tmux: Navigate up"))
keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", opts("Tmux: Navigate right"))
