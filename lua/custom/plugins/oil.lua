return {
  {
    'stevearc/oil.nvim',
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    opts = {

      columns = { 'icon' },
      keymaps = {
        ['<C-h>'] = false,
        ['<C-l>'] = false,
        ['<C-k>'] = false,
        ['<C-j>'] = false,
        ['<M-h>'] = 'actions.select_split',
      },
    },
    keys = {
      {
        '-',
        function()
          require('oil').open()
        end,
        desc = 'Open parent directory with oil',
      },
      {
        '<leader>o',
        function()
          require('oil').toggle_float()
        end,
      },
      {
        '<leader>so',
        function()
          return require('fzf-lua').fzf_exec('fd --hidden --exclude .git --type directory --max-depth 8', {
            fzf_colors = true,

            actions = {
              ['default'] = function(selected, selected_opts)
                require('oil').open(selected[1])
              end,
            },
          })
        end,
      },
    },
  },
}
