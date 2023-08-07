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
  persist_size = true,
  direction = "horizontal",
  close_on_exit = true,
  shell = vim.o.shell,
  auto_scroll = false,
  float_opts = { border = "curved" },
})

function _G.set_terminal_keymaps()
  local keymap = vim.api.nvim_buf_set_keymap
  local opts = function(desc)
    return { noremap = true, desc = "Toggleterm: " .. desc }
  end
  keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts("close terminal"))
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
