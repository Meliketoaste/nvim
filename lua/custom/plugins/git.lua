return {
  -- {
  --   'sindrets/diffview.nvim', -- optional - Diff integration
  -- },
  {

    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed.
    },
    keys = {
      {
        '<leader>N',
        function()
          require('neogit').open()
        end,
      },
    },
    config = true,
  },
}
