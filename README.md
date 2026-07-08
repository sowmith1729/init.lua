# Neovim Configuration

Personal config based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
(the current `vim.pack`-based version). Requires **Neovim 0.12+**.

## Layout

- `.config/nvim/init.lua` — kept close to upstream kickstart; every personal
  deviation is marked with a `NOTE(custom)` comment, so updating is a matter of
  diffing against upstream.
- `.config/nvim/lua/custom/plugins/*.lua` — personal plugins and config, one
  file per plugin/topic, auto-loaded by `custom/plugins/init.lua`
  (options, gruvbox, harpoon, oil, undotree, fugitive, render-markdown, vimtex,
  LSP extras, folds, ...).

## Plugins

Managed by Neovim's built-in `vim.pack` — no external plugin manager.

- Add a plugin: drop a file in `lua/custom/plugins/` with
  `vim.pack.add { 'https://github.com/owner/repo' }` followed by its setup call.
- Update plugins: `:lua vim.pack.update()` (review the buffer, `:w` to apply).
- Versions are pinned in `nvim-pack-lock.json`.
- First start after cloning bootstraps everything: plugins clone, treesitter
  parsers compile, Mason installs LSP servers/formatters (`:Mason` to inspect).

## LaTeX

vimtex + okular with SyncTeX (localleader is `<space>`):

- `<space>ll` start/stop continuous compilation, `<space>lv` jump okular to the
  cursor, `<space>le` errors in quickfix, `<space>lc` clean aux files.
- Inverse search: Shift+LeftClick in okular (Browse mode, `Ctrl+1`), with the
  okular editor command set to `nvim --headless -c "VimtexInverseSearch %l '%f'"`.

## Install

Uses Stow to manage symlinks: clone into `~/.dotfiles`, then run
`stow nvim` from `~/.dotfiles` to create `~/.config/nvim`.
