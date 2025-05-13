return {
  {
    'brenton-leighton/multiple-cursors.nvim',
    version = '*',
    config = function()
      require('multiple-cursors').setup()

      vim.keymap.set({ 'n', 'i', 'x' }, '<C-Up>', '<Cmd>MultipleCursorsAddUp<CR>', { desc = 'Add cursor and move up', noremap = true })
      vim.keymap.set({ 'n', 'i', 'x' }, '<C-Down>', '<Cmd>MultipleCursorsAddDown<CR>', { desc = 'Add cursor and move down', noremap = true })

      vim.keymap.set({ 'n', 'i' }, '<C-LeftMouse>', '<Cmd>MultipleCursorsMouseAddDelete<CR>', { desc = 'Add or remove cursor', noremap = true })

      vim.keymap.set({ 'x' }, '<Leader>m', '<Cmd>MultipleCursorsAddVisualArea<CR>', { desc = 'Add cursors to visual area lines', noremap = true })

      vim.keymap.set({ 'n', 'x' }, '<Leader>a', '<Cmd>MultipleCursorsAddMatches<CR>', { desc = 'Add cursors to cword', noremap = true })
      vim.keymap.set({ 'n', 'x' }, '<Leader>A', '<Cmd>MultipleCursorsAddMatchesV<CR>', { desc = 'Add cursors to cword in previous area', noremap = true })
      vim.keymap.set({ 'n', 'x' }, '<Leader>d', '<Cmd>MultipleCursorsAddJumpNextMatch<CR>', { desc = 'Add cursor and jump to next cword', noremap = true })
      vim.keymap.set({ 'n', 'x' }, '<Leader>D', '<Cmd>MultipleCursorsJumpNextMatch<CR>', { desc = 'Jump to next cword', noremap = true })
      vim.keymap.set({ 'n', 'x' }, '<Leader>l', '<Cmd>MultipleCursorsLock<CR>', { desc = 'Lock virtual cursors', noremap = true })
    end,
  },
}
