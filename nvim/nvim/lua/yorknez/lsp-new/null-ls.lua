local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,

    -- js
    null_ls.builtins.formatting.prettierd.with({
      disabled_filetypes = { 'html' },
    }),
  }
})
