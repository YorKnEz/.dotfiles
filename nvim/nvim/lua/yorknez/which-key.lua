local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

wk.register({
  --[[ g = { ]]
  --[[   name = "Lsp", ]]
  --[[   D = { "Declaration" }, ]]
  --[[   d = { "Definition" }, ]]
  --[[   I = { "Implementation" }, ]]
  --[[   r = { "References" }, ]]
  --[[   l = { "Diagnostics" }, ]]
  --[[ }, ]]
  K = { "Hover" },
  ["<leader>"] = {
    ["/"] = { "Toggle comment" },
    e = { "Toggle NvimTree" },
    b = {
      name = "Buffer",
      v = { "Split buffer vertically" },
      h = { "Split buffer horizontally" },
      f = { "Format current buffer" },
      c = { "Prettier" },
    },
    f = {
      name = "Telescope",
      f = { "Find files" },
      t = { "Live grep" },
      p = { "Projects" },
      b = { "Buffers" },
    },
    d = {
      name = "Debugger",
      b = { "Toggle breakpoint" },
      c = { "Continue" },
      i = { "Step into" },
      o = { "Step over" },
      O = { "Step out" },
      r = { "Toggle REPL" },
      l = { "Run last" },
      u = { "Toggle dapui" },
      t = { "Terminate" },
    },
    l = {
      name = "Lsp",
      f = { "Format" },
      i = { "Lsp info" },
      I = { "Lsp install info" },
      a = { "Code actions" },
      j = { "Next diagnostic" },
      k = { "Prev diagnostic" },
      r = { "Rename" },
      s = { "Signature help" },
      q = { "Add buffer diagnostics" },
    },
    t = {
      name = "Terminal",
      t = { "Toggle terminal" },
      g = { "Toggle lazygit" },
    },
  }
})
