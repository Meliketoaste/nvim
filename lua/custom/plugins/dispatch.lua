-- TODO: templates or something
-- function make_async_run(cmd)
--   -- -- local cmd, num_subs = vim.o.makeprg:gsub("%$%*", params.args)
--   -- if num_subs == 0 then
--   -- 	cmd = cmd .. " " .. params.args
--   -- end
--   return function()
--     local task = require('overseer').new_task {
--       cmd = vim.fn.expandcmd(cmd),
--       components = {
--         { 'on_output_quickfix', open = true, open_height = 8 },
--         'default',
--       },
--     }
--     task:start()
--   end
-- end
return { -- ... I'll do it myself ):
  -- {
  --   'msaher/makegrep-job.nvim',
  --   config = function()
  --     local mg = require 'makegrep-job'
  --     local opts = { nargs = '*', complete = 'file' }
  --
  --     vim.api.nvim_create_user_command('Grep', function(data)
  --       mg.grep(data.args, {})
  --     end, opts)
  --
  --     vim.api.nvim_create_user_command('Lgrep', function(data)
  --       mg.grep(data.args, { loclist = true })
  --     end, opts)
  --
  --     vim.api.nvim_create_user_command('Make', function(data)
  --       mg.make(data.args, {})
  --     end, opts)
  --
  --     vim.api.nvim_create_user_command('Lmake', function(data)
  --       mg.make(data.args, { loclist = true })
  --     end, opts)
  --   end,
  -- },
  -- 'preservim/vimux.git',.
  -- 'skywind3000/asyncrun.vim',
  -- {
  --   'pianocomposer321/officer.nvim',
  --   dependencies = 'stevearc/overseer.nvim',
  --   config = function()
  --     require('officer').setup {
  --       -- config
  --     }
  --   end,
  -- },
  -- { 'stevearc/overseer.nvim' },

  -- {
  --   'tpope/vim-dispatch', keys = {
  --     '<leader>r',
  --   '<Cmd>Dispatch<CR>',
  -- }
  -- },
  -- optional but highly recommended, for async support
  --
  -- {
  --   -- 'romainchapou/confiture.nvim',
  --   dependencies = 'tpope/vim-dispatch', -- optional but highly recommended, for async support
  -- },
  -- {
  --   'stevearc/overseer.nvim',
  --   lazy = false,
  --   config = function()
  --     require('overseer').setup {
  --       component_aliases = {
  --         -- Most tasks are initialized with the default components
  --         default = {
  --           { 'display_duration', detail_level = 2 },
  --           'on_output_summarize',
  --           'on_exit_set_status',
  --           'on_complete_notify',
  --           'on_complete_dispose',
  --           -- Not default
  --           'on_output_quickfix',
  --         },
  --       },
  --     }
  --     vim.api.nvim_create_user_command('Makee', function(params)
  --       -- Insert args at the '$*' in the makeprg
  --       local cmd, num_subs = vim.o.makeprg:gsub('%$%*', params.args)
  --       if num_subs == 0 then
  --         cmd = cmd .. ' ' .. params.args
  --       end
  --       local task = require('overseer').new_task {
  --         cmd = vim.fn.expandcmd(cmd),
  --         components = {
  --           { 'on_output_quickfix', open = not params.bang, open_height = 8 },
  --           'default',
  --         },
  --       }
  --       task:start()
  --     end, {
  --       desc = 'Run your makeprg as an Overseer task',
  --       nargs = '*',
  --       bang = true,
  --     })
  --   end,
  --   keys = {
  --
  --     {
  --       '<leader>r',
  --       function()
  --         make_async_run(vim.bo.makeprg)()
  --       end,
  --       desc = 'temporarily',
  --     },
  --     { '<leader>tr', '<cmd>OverseerRun<CR>', desc = 'Run task' },
  --     { '<leader>tt', '<cmd>OverseerToggle<CR>', desc = 'Tasks toggle' },
  --     { '<leader>tl', '<cmd>OverseerRestartLast<CR>', desc = 'Last task restart' },
  --     { '<leader>ti', '<cmd>OverseerInfo<CR>', desc = 'Info tasks' },
  --   },
  -- },
  {
    'tpope/vim-dispatch',
    config = function() end,
    keys = {
      {
        '<M-m>',
        '<Cmd>Make<CR>',
      },
    },
  },
}
