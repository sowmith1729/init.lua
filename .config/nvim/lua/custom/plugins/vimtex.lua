-- LaTeX editing: compile, view with SyncTeX, navigate
-- https://github.com/lervag/vimtex
--
-- Everyday flow (localleader is <space>, so these are <space>l...):
--   <localleader>ll  start/stop continuous compilation (latexmk -pvc, respects .latexmkrc)
--   <localleader>lv  forward search: jump okular to the cursor's position in the PDF
--   <localleader>le  show compile errors in the quickfix list
--   <localleader>lt  table of contents
--   <localleader>lc  clean auxiliary files
--
-- Inverse search (PDF -> nvim): one-time okular setup under
--   Settings > Configure Okular > Editor > Custom Text Editor, command:
--     nvim --headless -c "VimtexInverseSearch %l '%f'"
-- then Shift+LeftClick in the PDF jumps nvim to that source line.

vim.pack.add { 'https://github.com/lervag/vimtex' }

vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_view_general_options = '--noraise --unique file:@pdf#src:@line@tex'

-- Only auto-open the quickfix list on errors; warnings are available
-- on demand via <localleader>le (set to 0/2 to tweak further, :h g:vimtex_quickfix_mode)
vim.g.vimtex_quickfix_open_on_warning = 0
