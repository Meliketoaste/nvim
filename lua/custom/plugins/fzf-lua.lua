return {
  'ibhagwan/fzf-lua',
  cmd = 'FzfLua',
  config = function()
    local fzf = require 'fzf-lua'
    fzf.setup {
      fzf_colors = true,
      fzf_opts = {
        ['--no-scrollbar'] = true,
      },
      defaults = {
        formatter = 'path.dirname_first',
      },
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
          ['alt-i'] = { fzf.actions.toggle_ignore },
          ['alt-h'] = { fzf.actions.toggle_hidden },
        },
      },
      grep = {
        actions = {
          ['alt-i'] = { fzf.actions.toggle_ignore },
          ['alt-h'] = { fzf.actions.toggle_hidden },
        },
      },
      file_icon_padding = '',
    }
    vim.keymap.set('n', '<leader>sd', fzf.diagnostics_document, { desc = '[S]earch [D]iagnostics Current-File' })
    vim.keymap.set('n', '<leader>:', fzf.command_history, { desc = '[:] Command-History' })
    vim.keymap.set('n', '<leader>sb', fzf.buffers, { desc = '[S]earch [B]uffers' })
    vim.keymap.set('n', '<leader>sg', fzf.live_grep, { desc = '[S]earch [G]rep' })
    vim.keymap.set('n', '<leader>sf', fzf.files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>?', fzf.builtin, { desc = '[?] Built-in' })
  end,
}
