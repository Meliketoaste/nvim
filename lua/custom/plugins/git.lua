return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signcolumn = false,
      numhl = true,
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        vim.keymap.set('n', ']h', function()
          if vim.wo.diff then
            vim.cmd.normal { ']h', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next git [h]unk' })

        vim.keymap.set('n', '[h', function()
          if vim.wo.diff then
            vim.cmd.normal { '[h', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous git [h]unk' })

        -- stylua: ignore start
        vim.keymap.set('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'git [s]tage hunk' })
        vim.keymap.set('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'gitr[r]eset hunk' })
        -- stylua: ignore end

        vim.keymap.set('n', '<leader>ghs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
        vim.keymap.set('n', '<leader>ghr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
        vim.keymap.set('n', '<leader>ghS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
        vim.keymap.set('n', '<leader>ghu', gitsigns.stage_hunk, { desc = 'git [u]ndo stage hunk' })
        vim.keymap.set('n', '<leader>ghR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
        vim.keymap.set('n', '<leader>ghp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
        vim.keymap.set('n', '<leader>ghb', gitsigns.blame_line, { desc = 'git [b]lame line' })
        vim.keymap.set('n', '<leader>ghd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
        -- stylua: ignore
        vim.keymap.set('n', '<leader>ghD', function() gitsigns.diffthis '@' end, { desc = 'git [D]iff against last commit' })

        vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
        vim.keymap.set('n', '<leader>tD', gitsigns.preview_hunk_inline, { desc = '[T]oggle git show [D]eleted' })
        Snacks.toggle({
          name = 'Git Signs',
          get = function() return require('gitsigns.config').config.signcolumn end,
          set = function(state) require('gitsigns').toggle_signs(state) end,
        }):map '<leader>uG'
      end,
    },
  },
}
