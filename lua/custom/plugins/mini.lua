return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup()
      require('mini.extra').setup()
      require('mini.pick').setup()
      require('mini.files').setup()
      require('mini.surround').setup()
    end,
  },
}
