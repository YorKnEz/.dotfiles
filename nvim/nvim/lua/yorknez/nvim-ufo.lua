local ufo_status_ok, ufo = pcall(require, "ufo")
if not ufo_status_ok then
  return
end

vim.keymap.set("n", "zR", ufo.openAllFolds, { desc = "Open all folds" })
vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "Close all folds" })

ufo.setup()
