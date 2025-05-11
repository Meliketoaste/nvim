vim.o.inccommand = 'split'
vim.o.smartcase = true
vim.o.ignorecase = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.splitbelow = true
vim.o.splitright = true

vim.o.signcolumn = 'auto'
vim.opt.shada = { "'10", '<0', 's10', 'h' }

vim.o.swapfile = false

vim.opt.formatoptions:remove 'o'

vim.o.wrap = true
vim.o.linebreak = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.more = false
vim.o.foldmethod = 'manual'

vim.o.title = true
vim.o.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a (nvim)'
vim.o.undofile = true
vim.o.clipboard = 'unnamedplus'

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank { timeout = 100 }
  end,
})

local function create_augroup(filetype, callback)
  if type(filetype) == 'table' then
    for _, ft in ipairs(filetype) do
      create_augroup(ft, callback)
    end
  else
    local group = vim.api.nvim_create_augroup(filetype .. '_augroup', {})
    vim.api.nvim_create_autocmd({ 'FileType' }, {
      pattern = filetype,
      callback = callback,
      group = group,
    })
  end
end

create_augroup('odin', function()
  if vim.fn.filereadable 'build.sh' == 1 and vim.fn.has 'unix' then
    vim.api.nvim_set_option_value('makeprg', 'sh ./build.sh', { buf = 0 })
  elseif vim.fn.filereadable 'build.bat' == 1 and not vim.fn.has 'unix' then
    vim.api.nvim_set_option_value('makeprg', './build.bat', { buf = 0 })
  else
    vim.api.nvim_set_option_value('makeprg', 'odin build .', { buf = 0 })
  end
end)
