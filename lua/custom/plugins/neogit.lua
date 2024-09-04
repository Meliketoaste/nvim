return {
  'NeogitOrg/neogit',
  --dev = true,
  dependencies = {
    'nvim-lua/plenary.nvim',

    'sindrets/diffview.nvim', -- optional - Diff integration
    -- "sindrets/diffview.nvim",
  },

  keys = {
    {
      '<leader>g',
      function()
        require('neogit').open()
      end,
    },
  },
  config = true,
  --config = function()
  --  --require("neogit").setup {
  --  --  integrations = {
  --  --    --fzf_lua = true, -- Enable Telescope integration
  --  --  },
  --  --  -- Other configurations here
  --  --}
  --end,
}
