local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
  return
end

indent_blankline.setup {
  indent = {
    char = "▏",
  },
  whitespace = {
    remove_blankline_trail = false,
  },
  -- show_trailing_blankline_indent = false,
  -- show_first_indent_level = true,
  scope = {
    enabled = true,
    show_start = false,
    show_end = false,
  },
  exclude = {
    filetypes = {
      "NvimTree",
    },
  },
}
