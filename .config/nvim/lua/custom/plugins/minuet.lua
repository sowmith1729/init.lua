-- AI ghost-text completion from a self-hosted model (Ollama on the a40a GPU box)
-- https://github.com/milanglacier/minuet-ai.nvim
--
-- Needs the tunnel to the GPU host running:
--   ssh -f -N -L 11434:localhost:11434 a40a
-- and `ollama serve` + qwen2.5-coder on that host. Without the tunnel the
-- plugin stays quiet; nothing breaks.
--
-- Keymaps (insert mode): <A-y> accept, <A-l> accept one line,
--   <A-e> dismiss, <A-i> trigger manually

vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/milanglacier/minuet-ai.nvim',
}

require('minuet').setup {
  provider = 'openai_fim_compatible',
  n_completions = 1, -- single suggestion keeps the shared GPU polite and latency low
  context_window = 4096,
  provider_options = {
    openai_fim_compatible = {
      api_key = 'TERM', -- dummy: any non-empty env var name; ollama needs no key
      name = 'Ollama (a40a)',
      end_point = 'http://127.0.0.1:11434/v1/completions',
      -- 3b: ~340ms round-trip through the tunnel; 7b: smarter but ~870ms
      model = 'qwen2.5-coder:3b',
      optional = {
        max_tokens = 128,
        stop = { '\n\n' },
      },
    },
  },
  virtualtext = {
    -- Ghost text on by default in code filetypes; add/remove to taste
    auto_trigger_ft = { 'c', 'cpp', 'cuda', 'python', 'rust', 'lua', 'julia', 'javascript', 'typescript', 'sh', 'zsh' },
    keymap = {
      accept = '<A-y>',
      accept_line = '<A-l>',
      dismiss = '<A-e>',
      -- Manual trigger also works in filetypes without auto-trigger
      accept_n_lines = '<A-z>',
    },
  },
}

-- Manual trigger for any filetype
vim.keymap.set('i', '<A-i>', function() require('minuet.virtualtext').action.next() end, { desc = 'Minuet: trigger/next completion' })
