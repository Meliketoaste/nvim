-- print 'hello'
--
local tmpfile = os.tmpname()
vim.api.nvim_create_user_command('MakeAsync', function()
  vim.system({ 'tmux', 'split-window', '-v', '-p', '35', '"./run.sh"' }, { text = true }, function(res)
    if res.code == 0 then
      local f = io.open(tmpfile, 'w')
      f:write(res.stdout)
      f:close()
    else
      print('Command failed:', res.stderr)
    end
  end)
end, { desc = 'FUCK YOU' })

vim.keymap.set('n', '<leader>r', '<Cmd>MakeAsync<CR>', { desc = 'Run program' })

--
-- What i am going  to do
--
