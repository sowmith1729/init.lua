-- Indentation guides, with scope highlighting disabled
-- https://github.com/lukas-reineke/indent-blankline.nvim

vim.pack.add { 'https://github.com/lukas-reineke/indent-blankline.nvim' }
require('ibl').setup {
  scope = { enabled = false },
}
