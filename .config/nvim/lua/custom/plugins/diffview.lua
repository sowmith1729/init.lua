-- Side-by-side diffs for the working tree, commit ranges, and file history
-- https://github.com/sindrets/diffview.nvim

vim.pack.add { 'https://github.com/sindrets/diffview.nvim' }
require('diffview').setup {}

vim.keymap.set('n', '<leader>gd', function()
  if require('diffview.lib').get_current_view() then
    vim.cmd 'DiffviewClose'
  else
    vim.cmd 'DiffviewOpen'
  end
end, { desc = 'Toggle [G]it [D]iffview' })

vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory %<CR>', { desc = '[G]it file [H]istory' })
