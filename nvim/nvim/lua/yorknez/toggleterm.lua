local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<leader>tt]],
	hide_numbers = true,
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
	},
})

function _G.set_terminal_keymaps()
  local keymap = vim.api.nvim_buf_set_keymap
  local opts = function(desc)
    return { noremap = true, desc = "Toggleterm: ".. desc }
  end
  -- keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts("expand left"))
  keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts("expand down"))
  keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts("expand up"))
  keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts("expand right"))
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

