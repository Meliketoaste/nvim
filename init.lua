--[[
-- Setup initial configuration,
-- 
-- Primarily just download and execute lazy.nvim
--]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Load dotenv, if it exists
-- require('custom.dotenv').eval(vim.fs.joinpath(vim.fn.stdpath 'config', '.env')) ---@diagnostic disable-line: param-type-mismatch
--
-- vim.api.nvim_create_autocmd('QuickFixCmdPost', {
--   callback = function()
--     vim.cmd [[Trouble qflist open]]
--   end,
-- })
--
--
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end

-- Add lazy to the `runtimepath`, this allows us to `require` it.
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  spec = {
    -- import your plugins
    { import = 'custom/plugins' },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { 'habamax' } },
  -- automatically check for plugin updates
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = false,
    notify = false, -- get a notification when changes are found
  },
}

-- vim.api.nvim_create_user_command('Odin', function(cmd)
--   cmd = vim.list_extend(vim.list_extend({ 'odin' }, cmd.fargs), { '-terse-errors' })
--
--   local command_res = vim.system(cmd):wait()
--
--   if command_res.code == 0 and command_res.stdout ~= nil then
--     print(command_res.stdout)
--     vim.fn.setqflist {}
--     vim.cmd [[ cwindow ]]
--     return
--   end
--
--   if command_res.stderr == nil then
--     vim.fn.setqflist {}
--     vim.cmd [[ cwindow ]]
--     return
--   end
--
--   local err_lines = vim.split(command_res.stderr, '\n', { plain = true, trimempty = true })
--
--   vim.fn.setqflist({}, 'r', {
--     efm = [[%f(%l:%c)\ %m]],
--     lines = err_lines,
--   })
-- end, { nargs = '+' })
