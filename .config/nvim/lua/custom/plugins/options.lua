-- Personal options and keymaps, applied on top of the kickstart defaults in init.lua

vim.o.termguicolors = true
vim.o.relativenumber = true

-- Keep a bit less context around the cursor than the kickstart default (10)
vim.o.scrolloff = 8

-- 4-space indentation by default
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Clipboard: the OS clipboard stays independent; yank/paste to it explicitly
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank line to system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete without yanking' })
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste over selection without yanking it' })

-- Move the selected lines up/down, reindenting as they go
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Diagnostics & quickfix
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })
vim.keymap.set('n', 'gn', '<cmd>cnext<CR>', { desc = 'Next quickfix item' })
vim.keymap.set('n', 'gp', '<cmd>cprev<CR>', { desc = 'Previous quickfix item' })
