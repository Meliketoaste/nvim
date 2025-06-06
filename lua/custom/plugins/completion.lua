vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.shortmess:append 'c'
return {

  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',

    version = '1.*',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            -- config = function()
            --   local ls = require 'luasnip'
            --   local s = ls.snippet
            --   local i = ls.insert_node
            --
            --   local fmt = require('luasnip.extras.fmt').fmt
            --
            --   ls.add_snippets('all', {
            --     s('rererere', fmt('let {} = [%sedlex.regexp? {}]{}', { i(1), i(2), i(0) })),
            --   })
            -- end,
          },
        },
      },
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },
      appearance = { nerd_font_variant = 'mono' },

      completion = {
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev', 'buffer' },
        providers = {
          lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },

      cmdline = {
        completion = { menu = { auto_show = true } },
        sources = function()
          local type = vim.fn.getcmdtype()
          if type == '/' or type == '?' then
            return { 'buffer' }
          elseif type == ':' then
            return { 'cmdline', 'path' }
          else
            return {}
          end
        end,
      },
      snippets = { preset = 'luasnip' },

      fuzzy = { implementation = 'prefer_rust' },

      signature = { enabled = true },
    },
  },
}
