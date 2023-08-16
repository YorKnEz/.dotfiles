local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  size = 20,
  open_mapping = [[<leader>tt]],
  on_open = function(t)
    -- reset nvimtree in order to take the full height of the window
    local api = require("nvim-tree.api")
    api.tree.toggle({ focus = false })
    api.tree.toggle({ focus = false })
    -- hide the status column inside the terminal
    vim.opt_local.statuscolumn = ""
  end,
  --[[ hide_numbers = true, ]]
  shade_terminals = true,
  shading_factor = 0,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  direction = "horizontal",
  close_on_exit = true,
  shell = vim.o.shell,
  auto_scroll = false,
  float_opts = { border = "curved" },
})

function _G.set_terminal_keymaps()
  local keymap = vim.keymap.set
  local opts = function(desc)
    return { noremap = true, desc = "Toggleterm: " .. desc, buffer = 0 }
  end
  keymap("t", "<esc>", [[<C-\><C-n>]], opts("close terminal"))
  keymap("t", "jk", [[<C-\><C-n>]], opts("close terminal"))
  keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts("hello"))
  keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts("hello"))
  keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts("hello"))
  keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts("hello"))
  keymap("t", "<C-w>", [[<C-\><C-n><C-w>]], opts("hello"))
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
})

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end
