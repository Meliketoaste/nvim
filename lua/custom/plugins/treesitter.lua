return {
  'nvim-treesitter/nvim-treesitter',
  main = 'nvim-treesitter.configs',
  dependencies = {
    'stevearc/aerial.nvim',
    'andymass/vim-matchup',
    'RRethy/nvim-treesitter-endwise',
    'Meliketoaste/nvim-treesitter-textobjects',
  },
  event = { 'BufReadPost', 'BufNewFile', 'BufWritePost' },
  cmd = {
    'TSBufDisable',
    'TSBufEnable',
    'TSBufToggle',
    'TSDisable',
    'TSEnable',
    'TSToggle',
    'TSInstall',
    'TSInstallInfo',
    'TSInstallSync',
    'TSModuleInfo',
    'TSUninstall',
    'TSUpdate',
    'TSUpdateSync',
  },
  build = ':TSUpdate',
  init = function(plugin)
    require('lazy.core.loader').add_to_rtp(plugin)
    require 'nvim-treesitter.query_predicates'
  end,
  opts = function(_, opts)
    -- if require('util').is_available 'mason.nvim' then
    --   require('lazy').load { plugins = { 'mason.nvim' } }
    -- end

    auto_install = true
    --   vim.fn.executable 'git' == 1 and vim.fn.executable 'tree-sitter' == 1, -- only enable auto install if `tree-sitter` cli is installed
    --   vim.fn.executable 'tree-sitter' == 1 -- only enable auto install if `tree-sitter` cli is installed
    opts.ensure_installed = {
      'vim',
      'vimdoc',

      'c',
      'cpp',
      'java',
      'c_sharp',

      'go',
      'rust',

      'lua',
      'luadoc',

      'python',

      'jsdoc',
      'javascript',
      'typescript',

      'glsl',
      'hlsl',
      'wgsl',

      'css',
      'html',

      'json',
      'jsonc',
      'odin',

      'markdown',
      'markdown_inline',

      'regex',
      'bash',
      'query',
    }
    opts.highlight = { enable = true }
    opts.incremental_selection = { enable = true }
    opts.indent = { enable = true }
    opts.matchup = { enable = true }
    opts.endwise = { enable = true }
    opts.textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['ak'] = { query = '@block.outer', desc = 'around block' },
          ['ik'] = { query = '@block.inner', desc = 'inside block' },
          ['ac'] = { query = '@class.outer', desc = 'around class' },
          ['ic'] = { query = '@class.inner', desc = 'inside class' },
          ['ag'] = { query = '@call.outer', desc = 'around call' },
          ['ig'] = { query = '@call.inner', desc = 'inside call' },
          ['a?'] = { query = '@conditional.outer', desc = 'around conditional' },
          ['i?'] = { query = '@conditional.inner', desc = 'inside conditional' },
          ['af'] = { query = '@function.outer', desc = 'around function ' },
          ['if'] = { query = '@function.inner', desc = 'inside function ' },
          ['al'] = { query = '@loop.outer', desc = 'around loop' },
          ['il'] = { query = '@loop.inner', desc = 'inside loop' },
          ['aa'] = { query = '@parameter.outer', desc = 'around argument' },
          ['ia'] = { query = '@parameter.inner', desc = 'inside argument' },
          ['a='] = { query = '@assignment.lhs', desc = 'Select left hand side of an assignment' },
          ['i='] = { query = '@assignment.rhs', desc = 'Select right hand side of an assignment' },
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          [']k'] = { query = '@block.outer', desc = 'Next block start' },
          [']g'] = { query = '@call.outer', desc = 'Next call start' },
          [']f'] = { query = '@function.outer', desc = 'Next function start' },
          [']a'] = { query = '@parameter.inner', desc = 'Next argument start' },
          [']c'] = { query = '@class.outer', desc = 'Next class start' },
          [']l'] = { query = '@loop.outer', desc = 'Next loop start' },
        },
        goto_next_end = {
          [']K'] = { query = '@block.outer', desc = 'Next block end' },
          [']G'] = { query = '@all.outer', desc = 'Next call end' },
          [']F'] = { query = '@function.outer', desc = 'Next function end' },
          [']A'] = { query = '@parameter.inner', desc = 'Next argument end' },
          [']C'] = { query = '@class.outer', desc = 'Next class end' },
          [']L'] = { query = '@loop.outer', desc = 'Next loop end' },
        },
        goto_previous_start = {
          ['[k'] = { query = '@block.outer', desc = 'Previous block start' },
          ['[g'] = { query = '@call.outer', desc = 'Previous block start' },
          ['[f'] = { query = '@function.outer', desc = 'Previous function start' },
          ['[a'] = { query = '@parameter.inner', desc = 'Previous argument start' },
          ['[c'] = { query = '@class.outer', desc = 'Previous class start' },
          ['[l'] = { query = '@loop.outer', desc = 'Previous loop start' },
        },
        goto_previous_end = {
          ['[K'] = { query = '@block.outer', desc = 'Previous block end' },
          ['[G'] = { query = '@call.outer', desc = 'Previous call end' },
          ['[F'] = { query = '@function.outer', desc = 'Previous function end' },
          ['[A'] = { query = '@parameter.inner', desc = 'Previous argument end' },
          ['[C'] = { query = '@class.outer', desc = 'Previous class end' },
          ['[L'] = { query = '@loop.outer', desc = 'Previous loop end' },
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['>K'] = { query = '@block.outer', desc = 'Swap next block' },
          ['>G'] = { query = '@call.outer', desc = 'Swap next call' },
          ['>F'] = { query = '@function.outer', desc = 'Swap next function' },
          ['>A'] = { query = '@parameter.inner', desc = 'Swap next argument' },
          ['>C'] = { query = '@class.outer', desc = 'Swap next class' },
          ['>L'] = { query = '@loop.outer', desc = 'Swap next loop' },
        },
        swap_previous = {
          ['<K'] = { query = '@block.outer', desc = 'Swap previous block' },
          ['<G'] = { query = '@call.outer', desc = 'Swap previous call' },
          ['<F'] = { query = '@function.outer', desc = 'Swap previous function' },
          ['<A'] = { query = '@parameter.inner', desc = 'Swap previous argument' },
          ['<C'] = { query = '@class.outer', desc = 'Swap previous class' },
          ['<L'] = { query = '@loop.outer', desc = 'Swap previous loop' },
        },
      },
    }
  end,
  config = function(plugin, opts)
    local ts = require(plugin.main)
    local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

    vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
    vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)

    vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })

    ts.setup(opts)
  end,
}
