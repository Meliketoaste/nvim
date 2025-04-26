---@type LazySpec
return {
  'folke/snacks.nvim',

  priority = 1000,
  enabled = true,

  ---@module 'snacks.nvim'
  ---@type snacks.Config
  opts = {

    -- terminal = {
    --   enabled = true,
    -- },
    --
    -- dashboard = { enabled = true },
    -- explorer = { enabled = true },
    -- indent = { enabled = true },
    -- input = { enabled = true },
    -- picker = { enabled = true },
    -- notifier = { enabled = true },
    bigfile = {

      enabled = true,
    },

    zen = {
      enabled = true,
    },
    -- quickfile = { enabled = true },
    -- scope = { enabled = false },
    -- scroll = { enabled = false },
    statuscolumn = {
      enabled = false,
      left = { 'git', 'mark', 'sign' }, -- priority of signs on the left (high to low)
      right = { enabled = false }, -- priority of signs on the left (high to low)
      folds = { enabled = false },
      git = {
        -- patterns to match Git signs
        patterns = { 'GitSign', 'MiniDiffSign' },
      },
      refresh = 50, -- refresh at most every 50ms
    },
    words = { enabled = true },
  },
}
