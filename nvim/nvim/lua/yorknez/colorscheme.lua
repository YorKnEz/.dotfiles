-- local status_ok, catppuccin = pcall(require, "catppuccin")
-- if not status_ok then
--   return
-- end
--
-- catppuccin.setup({
--   flavour = "mocha",
--   transparent_background = true,
--   show_end_of_buffer = true,
--   dim_inactive = {
--     enabled = true,        -- dims the background color of inactive window
--     shade = "dark",
--     percentage = 0.60,     -- percentage of the shade to apply to the inactive window
--   },
-- })

vim.cmd.colorscheme("catppuccin-mocha")
