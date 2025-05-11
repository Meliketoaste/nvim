return {
  {
    'mbbill/undotree',
    lazy = false,
    cmd = 'UndotreeToggle',

    config = function()
      vim.keymap.set('n', '<leader>uu', Snacks.picker.undo)
    end,
  },
  {
    'nvim-lua/plenary.nvim',
  },
}
