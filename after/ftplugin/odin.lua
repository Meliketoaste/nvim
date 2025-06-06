local set = vim.opt_local

vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = true
vim.opt_local.autoindent = true
vim.opt_local.smartindent = true

-- vim.opt_local.cindent = true
-- vim.opt_local.cinoptions = ':0'
vim.cmd [[set errorformat=%f(%l:%c)\ %m ]]

-- vim.keymap.set('n', '<leader>R', function()
--
--   -- woah
-- end, { desc = 'RUNNIE' })
