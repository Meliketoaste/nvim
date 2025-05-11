return {
  {
    'mbbill/undotree',
    lazy = false,
    cmd = 'UndotreeToggle',

    config = function()
      vim.keymap.set('n', '<leader>uu', Snacks.picker.undo)
      vim.keymap.set('n', '<leader>ut', '<cmd>UndotreeToggle<CR>')
    end,
  },
  {
    'nvim-lua/plenary.nvim',
  },
}
