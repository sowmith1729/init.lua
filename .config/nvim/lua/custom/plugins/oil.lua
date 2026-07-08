-- Edit the filesystem like a buffer
-- https://github.com/stevearc/oil.nvim

vim.pack.add { 'https://github.com/stevearc/oil.nvim' }
require('oil').setup {
  columns = { 'icon' },
  view_options = {
    show_hidden = true,
  },
}

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<space>-', require('oil').toggle_float, { desc = 'Open parent directory (floating)' })
