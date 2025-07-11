return {
  {
    'stevearc/oil.nvim',
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    config = function()
      local oil = require 'oil'
      oil.setup {
        columns = { 'icon' },
        keymaps = {
          -- ['<C-h>'] = false,
          ['<C-l>'] = false,
          ['<C-k>'] = false,
          ['<C-j>'] = false,
          ['<M-h>'] = 'actions.select_split',
        },
        view_options = {
          show_hidden = true,
          -- is_always_hidden = function(name, _)
          --   local folder_skip = { 'dev-tools.locks', 'dune.lock', '_build' }
          --   return vim.tbl_contains(folder_skip, name)
          -- end,
        },
      }

      vim.keymap.set('n', '-', oil.open, { desc = 'Open parent directory with oil' })
      vim.keymap.set('n', '<leader>o', oil.toggle_float)
      vim.keymap.set('n', '<leader>so', function()
        return require('fzf-lua').fzf_exec('fd --hidden --exclude .git --type directory --max-depth 8', {
          fzf_colors = true,
          actions = {
            ['default'] = function(selected, selected_opts)
              require('oil').open(selected[1])
            end,
          },
        })
      end)
    end,
  },
}
