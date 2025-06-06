local fn = require('custom.f').fn

vim.keymap.set('n', '<c-j>', '<c-w><c-j>')
vim.keymap.set('n', '<c-k>', '<c-w><c-k>')
vim.keymap.set('n', '<c-l>', '<c-w><c-l>')
vim.keymap.set('n', '<c-h>', '<c-w><c-h>')

vim.keymap.set('n', '<leader>x', '<cmd>.lua<CR>', { desc = 'Execute the current line' })
-- vim.keymap.set('n', '<leader><leader>x', '<cmd>source %<CR>', { desc = 'Execute the current file' })
--
vim.api.nvim_del_keymap('n', 'gra') -- vim.lsp.buf...
-- vim.api.nvim_del_keymap('x', 'gra') -- vim.lsp.buf...
vim.api.nvim_del_keymap('n', 'gri') -- vim.lsp.buf...
vim.api.nvim_del_keymap('n', 'grn') -- vim.lsp.buf...
vim.api.nvim_del_keymap('n', 'grr') -- vim.lsp.buf...
-- vim.api.nvim_del_keymap('n', 'gO') -- vim.lsp.buf...

-- vim.api.nvim_del_keymap('n', ']d') -- vim.lsp.buf...
-- vim.api.nvim_del_keymap('n', ']D') -- vim.lsp.buf...

-- vim.api.nvim_del_keymap('n', 'gx') -- open filepath under cursor
-- vim.api.nvim_del_keymap('x', 'gx') -- open filepath under cursor

-- Toggle hlsearch if it's on, otherwise just do "enter"
vim.keymap.set('n', '<CR>', function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.v.hlsearch == 1 then
    vim.cmd.nohl()
    return ''
  else
    return vim.keycode '<CR>'
  end
end, { expr = true })

vim.keymap.set('n', ']d', fn(vim.diagnostic.jump, { count = 1, float = true }))
vim.keymap.set('n', '[d', fn(vim.diagnostic.jump, { count = -1, float = true }))

vim.keymap.set('n', '<M-,>', '<c-w>5<')
vim.keymap.set('n', '<M-.>', '<c-w>5>')
vim.keymap.set('n', '<M-t>', '<C-W>+')
vim.keymap.set('n', '<M-s>', '<C-W>-')

Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>us'
Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>uw'
Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>uL'
Snacks.toggle.diagnostics():map '<leader>ud'
Snacks.toggle.line_number():map '<leader>ul'
Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = 'Conceal Level' }):map '<leader>uc'
Snacks.toggle.option('showtabline', { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = 'Tabline' }):map '<leader>uA'
Snacks.toggle.treesitter():map '<leader>uT'
Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>ub'
Snacks.toggle.dim():map '<leader>uD'
Snacks.toggle.animate():map '<leader>ua'
Snacks.toggle.indent():map '<leader>ug'
Snacks.toggle.scroll():map '<leader>uS'
Snacks.toggle.profiler():map '<leader>dpp'
Snacks.toggle.profiler_highlights():map '<leader>dph'
Snacks.toggle.zen():map '<leader>uz'
Snacks.toggle
  .new({
    id = 'diagnostics_lines',
    name = 'Diagnostics Lines',
    get = function()
      return not not vim.diagnostic.config().virtual_lines
    end,
    set = function(state)
      if state then
        vim.g.virtual_text_opt = vim.diagnostic.config().virtual_text
        vim.diagnostic.config {
          virtual_lines = true,
          virtual_text = false,
        }
      else
        vim.diagnostic.config {
          virtual_lines = false,
          virtual_text = vim.g.virtual_text_opt,
        }
        vim.g.virtual_text_opt = nil
      end
    end,
  })
  :map '<leader>ul'

Snacks.toggle.inlay_hints():map '<leader>uh'

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.api.nvim_create_user_command('MakeAsync', function()
  vim.system({ 'tmux', 'split-window', '-v', '-p', '35', '"./run.sh"' }, { text = true }, function(res)
    if res.code == 0 then
      local f = io.open(os.tmpname(), 'w')
      f:write(res.stdout)
      f:close()
    else
      print('Command failed:', res.stderr)
    end
  end)
end, { desc = 'FUCK YOU' })

vim.keymap.set('n', '<leader>r', '<Cmd>MakeAsync<CR>', { desc = 'Run program' })
-- "https://dummyjson.com/products"
vim.api.nvim_create_user_command('QuicktypeFromClipboard', function() -- awesome for getting types from an json endpoint.
  local url = vim.fn.getreg('+'):gsub('%s+', '')
  if url == '' then
    print '❌ Clipboard is empty or not a valid URL'
    return
  end

  local name = ((url:match '^.+/(.+)$' or 'Type'):gsub('[^%w]', '')):gsub('^%l', string.upper)
  local out =
    vim.fn.system(string.format('curl -s "%s" | bunx quicktype --lang typescript --just-types --prefer-types --prefer-unions --top-level %s', url, name))
  if vim.v.shell_error ~= 0 then
    print '❌ Failed to fetch or convert JSON'
    return
  end

  local f = io.open(name .. '.ts', 'w')
  if f then
    f:write(out)
    f:close()
    vim.cmd('edit ' .. name .. '.ts')
  else
    print('❌ Failed to write file: ' .. name .. '.ts')
  end
end, {})
