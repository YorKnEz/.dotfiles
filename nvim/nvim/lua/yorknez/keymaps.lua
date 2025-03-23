-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = function(desc)
  return { silent = true, desc = desc }
end

--Remap space as leader key keymap("", "<Space>", "<Nop>", opts)
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
keymap("n", "<C-Up>", ":resize -2<CR>", opts("Resize window up"))
keymap("n", "<C-Down>", ":resize +2<CR>", opts("Resize window down"))
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts("Resize window left"))
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts("Resize window right"))

-- Buffers
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts("Buffer: Next buffer"))
keymap("n", "<S-h>", ":bprevious<CR>", opts("Buffer: Prev buffer"))
keymap("n", "<S-f>", ":ls<CR>:buffer<Space>", opts("Buffer: List buffers"))
-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts("Buffer: Close buffer"))

-- Split buffers
keymap("n", "<leader>bv", ":vnew<CR>", opts("Buffer: Split buffer vertically"))
keymap("n", "<leader>bh", ":new<CR>", opts("Buffer: Split buffer horizontally"))
-- Format
keymap("n", "<leader>bc", "<cmd>Prettier<CR>", opts("Buffer: Prettier"))

-- Clear highlights
--[[ keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts) ]]
-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts("Fast enter"))

-- Visual --
-- Better paste
keymap("v", "p", '"_dP', opts("Better paste"))

-- Stay in indent mode
keymap("v", "<", "<gv", opts("Indent left"))
keymap("v", ">", ">gv", opts("Indent right"))

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts("Move text down"))
keymap("v", "<A-k>", ":m .-2<CR>==", opts("Move text up"))

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts("Move text down"))
keymap("x", "K", ":move '<-2<CR>gv-gv", opts("Move text up"))
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts("Move text down"))
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts("Move text up"))

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts("Toggle NvimTree"))

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts("Telescope: Find files"))
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts("Telescope: Live grep"))
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts("Telescope: Projects"))
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts("Telescope: Buffers"))
keymap("n", "<leader>fk", ":Telescope keymaps<CR>", opts("Telescope: Keymaps"))
keymap("n", "<leader>fr", ":Telescope resume<CR>", opts("Telescope: Resume last picker"))

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts("Toggle linewise comment"))
keymap("x", "<leader>/", "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  opts("Toggle linewise comment visual"))

-- Vim-Tmux-Navigator
keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", opts("Tmux: Navigate left"))
keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", opts("Tmux: Navigate down"))
keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", opts("Tmux: Navigate up"))
keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", opts("Tmux: Navigate right"))
