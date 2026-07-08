-- Personal LSP additions on top of the kickstart LSP section in init.lua

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('custom-lsp-attach', { clear = true }),
  callback = function(event)
    -- Keep `gq` on Vim's default formatting instead of the LSP formatexpr
    vim.bo[event.buf].formatexpr = nil

    -- Pre-0.11 style LSP keymaps (the new gr* defaults from kickstart still work too)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end
    local builtin = require 'telescope.builtin'
    map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
    map('gr', builtin.lsp_references, '[G]oto [R]eferences')
    map('gI', builtin.lsp_implementations, '[G]oto [I]mplementation')
    map('<leader>D', builtin.lsp_type_definitions, 'Type [D]efinition')
    map('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
    map('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
  end,
})

-- Nicer diagnostic icons in the sign column (gutter)
if vim.g.have_nerd_font then
  local signs = { ERROR = '', WARN = '', INFO = '', HINT = '' }
  local diagnostic_signs = {}
  for type, icon in pairs(signs) do
    diagnostic_signs[vim.diagnostic.severity[type]] = icon
  end
  vim.diagnostic.config { signs = { text = diagnostic_signs } }
end

-- Language servers that are NOT managed by Mason (installed on the system).
-- `vim.lsp.config` merges these with the defaults shipped by nvim-lspconfig.

-- Julia: LanguageServer.jl, with the repo root as the project root
vim.lsp.config('julials', { root_markers = { '.git' } })
vim.lsp.enable 'julials'

-- Racket: racket-langserver (configured but not enabled by default)
vim.lsp.config('racket_langserver', { cmd = { 'racket', '--lib', 'racket-langserver' } })
-- vim.lsp.enable 'racket_langserver'
