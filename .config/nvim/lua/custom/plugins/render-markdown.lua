-- Render markdown files nicely in Neovim
-- See `:help render-markdown` or https://github.com/MeanderingProgrammer/render-markdown.nvim
-- Uses the treesitter markdown parsers (installed in init.lua) and mini.icons.

vim.pack.add { 'https://github.com/MeanderingProgrammer/render-markdown.nvim' }
require('render-markdown').setup {}
