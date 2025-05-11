return {
  {
    'Meliketoaste/cold.nvim',
    config = function()
      vim.cmd.colorscheme 'cold'
      local add = Snacks.util.blend('#11111a', '#78b957', 0.91)
      local change = Snacks.util.blend('#11111a', '#e8b940', 0.91)
      local delete = Snacks.util.blend('#11111a', '#f82920', 0.91)

      local stagedAdd = Snacks.util.blend('#020209', '#78b957', 0.91)
      local stagedChange = Snacks.util.blend('#020209', '#e8b940', 0.91)
      local stagedDelete = Snacks.util.blend('#020209', '#f82920', 0.91)

      local deletedAdd = Snacks.util.blend('#020209', '#78b957', 0.91)
      local deletedChange = Snacks.util.blend('#020209', '#e8b940', 0.91)
      local deletedDelete = Snacks.util.blend('#020209', '#f82920', 0.91)

      vim.api.nvim_set_hl(0, 'MiniDiffSignAdd', { fg = '#585858', bg = add })
      vim.api.nvim_set_hl(0, 'MiniDiffSignChange', { fg = '#585858', bg = change })
      vim.api.nvim_set_hl(0, 'MiniDiffSignDelete', { fg = '#585858', bg = delete })
      vim.api.nvim_set_hl(0, 'MiniDiffOverAdd', { fg = '#585858', bg = add })

      vim.api.nvim_set_hl(0, 'MiniDiffOverChange', { fg = '#585858', bg = change })
      vim.api.nvim_set_hl(0, 'MiniDiffOverChangeBuf', { fg = '#585858', bg = change })
      vim.api.nvim_set_hl(0, 'MiniDiffOverContext', { fg = '#585858', bg = delete })
      vim.api.nvim_set_hl(0, 'MiniDiffOverContextBuf', { fg = '#585858', bg = add })
      vim.api.nvim_set_hl(0, 'MiniDiffOverDelete', { fg = '#585858', bg = delete })
      vim.api.nvim_set_hl(0, 'DiffChange', { fg = '#585858', bg = change })
      vim.api.nvim_set_hl(0, 'DiffAdd', { fg = '#585858', bg = add })
      vim.api.nvim_set_hl(0, 'DiffDelete', { fg = '#585858', bg = delete })

      vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#585858', bg = add })

      -- vim.api.nvim_set_hl(0, 'GitSignsStagedUntracked', { fg = '#ff0000' })
      -- vim.api.nvim_set_hl(0, 'GitSignsStagedUntracked', { fg = '#ff0000' })
      -- vim.api.nvim_set_hl(0, 'GitSignsStagedAdd', { fg = '#ff0000' })
      -- vim.api.nvim_set_hl(0, 'GitSignsStagedUntracked', { fg = '#ff0000' })
      --
      -- vim.api.nvim_set_hl(0, 'GitSignsStagedUntracked', { fg = '#ff0000' })
      -- vim.api.nvim_set_hl(0, 'GitSignsStagedUntracked', { fg = '#ff0000' })
      -- vim.api.nvim_set_hl(0, 'GitSignsStagedAdd', { fg = '#ff0000' })
      -- vim.api.nvim_set_hl(0, 'GitSignsStagedUntracked', { fg = '#ff0000' })
      --
      -- vim.api.nvim_set_hl(0, 'GitSignsStagedChangeCul', { fg = '#ff0000' })
      -- vim.api.nvim_set_hl(0, 'GitSignsStagedChangedelete', { fg = '#ff0000' })
      -- GitSignsChangedeleteNr
      --

      vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#585858', bg = change })
      vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#585858', bg = delete })

      vim.api.nvim_set_hl(0, 'GitSignsStagedAddNr', { fg = '#585858', bg = add })
      vim.api.nvim_set_hl(0, 'GitSignsStagedChangeNr', { fg = '#585858', bg = change })
      vim.api.nvim_set_hl(0, 'GitSignsStagedDeleteNr', { fg = '#585858', bg = delete })
      vim.api.nvim_set_hl(0, 'GitSignsStagedTopdeleteNr', { fg = '#585858', bg = stagedDelete })
      vim.api.nvim_set_hl(0, 'GitSignsStagedUntrackedNr', { fg = '#ffff00', bg = stagedAdd })
      vim.api.nvim_set_hl(0, 'GitSignsStagedChangedeleteNr', { fg = '#585858', bg = stagedChange })
    end,
  },
  {
    'folke/tokyonight.nvim',
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false },
        },
      }
      -- vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
