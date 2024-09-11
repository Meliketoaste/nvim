return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',

  opts = function()
    require('bufferline').setup {}
  end,
}
