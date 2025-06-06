return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'ibhagwan/fzf-lua',
    },

    config = function()
      local neogit = require 'neogit'
      neogit.setup {
        integrations = {
          diffview = true,
          telescope = false,
          fzf = false,
          fzf_lua = true,
        },
        disable_commit_confirmation = true,
        auto_refresh = true,
        commit_popup = {
          kind = 'split',
        },
      }
      vim.keymap.set('n', '<leader>N', neogit.open)

      vim.keymap.set('n', '<leader>gp', function()
        neogit.open { 'push' }
      end)

      vim.keymap.set('n', '<leader>gc', function()
        require('neogit.buffers.commit_view').new('HEAD'):open()
      end)
      vim.keymap.set('n', '<leader>gl', '<CMD>Neogit log<CR>')
    end,
  },
}
