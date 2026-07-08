-- Colorscheme: gruvbox with a transparent background
-- https://github.com/ellisonleao/gruvbox.nvim

vim.pack.add { 'https://github.com/ellisonleao/gruvbox.nvim' }
vim.cmd.colorscheme 'gruvbox'
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
