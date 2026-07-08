-- Pin the current function/class signature to the top of the window
-- https://github.com/nvim-treesitter/nvim-treesitter-context

vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter-context' }
require('treesitter-context').setup {}

vim.keymap.set(
  'n',
  '<leader>gc',
  function() require('treesitter-context').go_to_context(vim.v.count1) end,
  { silent = true, desc = 'jump to context declaration (upward)' }
)
