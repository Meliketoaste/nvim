---@type LazySpec
return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    enabled = true,

    ---@module 'snacks.nvim'
    ---@type snacks.Config
    opts = {
      statuscolumn = { enabled = false },

      bigfile = { enabled = true },

      zen = { enabled = true },
      -- quickfile = { enabled = true },
      -- scope = { enabled = false },
      -- scroll = { enabled = false },
      words = { enabled = true },
    },
  },
}
