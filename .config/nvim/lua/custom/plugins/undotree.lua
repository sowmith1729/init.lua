-- Visualize the undo history
-- https://github.com/mbbill/undotree

vim.pack.add { 'https://github.com/mbbill/undotree' }
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'undotree toggle' })
