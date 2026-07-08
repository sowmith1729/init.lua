-- Quick navigation between a small set of marked files
-- https://github.com/ThePrimeagen/harpoon

vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' },
}

local harpoon = require 'harpoon'
harpoon:setup()

vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end, { desc = 'Harpoon: add file' })
vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon: quick menu' })

for i = 1, 9 do
  vim.keymap.set('n', ('<A-%d>'):format(i), function() harpoon:list():select(i) end, { desc = 'Harpoon: go to file ' .. i })
end
