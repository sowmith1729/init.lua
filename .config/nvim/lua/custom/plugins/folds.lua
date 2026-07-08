-- Folds: start with cheap manual folds so opening a file is NEVER blocked by
-- fold evaluation. The expensive treesitter foldexpr is attached a tick later
-- (and only when a parser exists), so it can't stall the initial buffer read.

vim.o.foldmethod = 'manual'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('custom-ts-folds', { clear = true }),
  callback = function(ev)
    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(ev.buf) then return end
      local win = vim.fn.bufwinid(ev.buf)
      if win == -1 then return end
      local ok, parser = pcall(vim.treesitter.get_parser, ev.buf)
      if ok and parser then
        vim.wo[win].foldmethod = 'expr'
        vim.wo[win].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      end
    end)
  end,
})
