return {
  'ibhagwan/fzf-lua',
  cmd = 'FzfLua',
  config = function()
    local fzf = require 'fzf-lua'
    local config = fzf.config
    local actions = fzf.actions
    fzf.setup {

      fzf_colors = true,

      -- Custom LazyVim option to configure vim.ui.select
      winopts = {
        width = 0.8,
        height = 0.8,
        row = 0.5,
        col = 0.5,
        preview = {
          scrollchars = { '|', '' },
        },
      },
      files = {
        cwd_prompt = false,
        actions = {
          ['alt-i'] = { actions.toggle_ignore },
          ['alt-h'] = { actions.toggle_hidden },
        },
      },
      grep = {
        actions = {
          ['alt-i'] = { actions.toggle_ignore },
          ['alt-h'] = { actions.toggle_hidden },
        },
      },
      file_icon_padding = '',
    }
  end,
  keys = {
    {
      '<leader>sf',
      function()
        require('fzf-lua').files()
      end,
      { desc = '[S]earch [F]iles' },
    },
    {
      '<leader>sg',
      function()
        require('fzf-lua').live_grep()
      end,
      { desc = '[S]earch [G]rep' },
    },
    {
      '<leader>sb',
      function()
        require('fzf-lua').buffers()
      end,
      { desc = '[S]earch [B]uffers' },
    },
    {
      '<leader>:',
      function()
        require('fzf-lua').command_history()
      end,
      { desc = '[:] Command-History' },
    },

    {
      '<leader>sd',
      function()
        require('fzf-lua').diagnostics_document()
      end,
      { desc = '[S]earch [D]iagnostics Current-File' },
    },

    { '<leader>?', '<cmd>FzfLua builtin<cr>', desc = '[?] Built-in' },
  },
}
