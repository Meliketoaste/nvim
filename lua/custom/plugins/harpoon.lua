return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',

    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    config = function()
      local harpoon = require 'harpoon'

      -- stylua: ignore start
      vim.keymap.set('n', '<leader>H', function() harpoon:list():add() end, { desc = 'Harpoon File' })
      vim.keymap.set('n', '<leader>h', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon File' })

      for i = 1, 5  do

        vim.keymap.set('n', "<leader>" .. i, function() harpoon:list():select(i) end, { desc = 'Harpoon to File ' .. i })
      end
    end,
  },
}
