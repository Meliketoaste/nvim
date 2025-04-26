local opt = vim.opt

----- Interesting Options -----

-- You have to turn this one on :)
opt.inccommand = 'split'

-- Best search settings :)
opt.smartcase = true
opt.ignorecase = true

----- Personal Preferences -----
opt.number = true
opt.relativenumber = true

opt.splitbelow = true
opt.splitright = true

opt.signcolumn = 'yes'
opt.shada = { "'10", '<0', 's10', 'h' }

opt.swapfile = false

-- Don't have `o` add a comment
opt.formatoptions:remove 'o'

opt.wrap = true
opt.linebreak = true

opt.tabstop = 4
opt.shiftwidth = 4

opt.more = false

opt.foldmethod = 'manual'

opt.title = true
opt.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a (nvim)'

opt.undofile = true

opt.clipboard = 'unnamedplus'

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank { timeout = 100 }
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
    vim.api.nvim_buf_set_option(0, 'makeprg', 'sh ./build.sh')
  elseif vim.fn.filereadable 'build.bat' == 1 and not vim.fn.has 'unix' then
    vim.api.nvim_buf_set_option(0, 'makeprg', './build.bat')
  else
    vim.api.nvim_buf_set_option(0, 'makeprg', 'odin build .')
  end
end)
