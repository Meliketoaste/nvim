---@type LazySpec
return {
  'folke/lazydev.nvim',
  cmd = { 'LazyDev' },
  ft = 'lua',

  opts = {
    library = {
      { 'lazy.nvim', words = { 'lazy', 'LazySpec', 'LazyKeys', 'LazyKeysSpec' } },
      { 'snacks.nvim', words = { 'Snacks' }, ft = 'lua' },
      -- See the configuration section for more details
      -- Load luvit types when the `vim.uv` word is found
      { path = 'luvit-meta/library', words = { 'vim%.uv' } },
    },
  },
  dependencies = {
    -- vim.uv typings
    { 'Bilal2453/luvit-meta', lazy = true },

    -- wezterm typings
    { 'justinsgithub/wezterm-types', lazy = true },
  },
}
