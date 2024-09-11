return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      --vim.cmd.colorscheme "tokyonight-night"
    end,
    opts = {},
  },
  {
    'rebelot/kanagawa.nvim',
    config = function()
      require('kanagawa').setup {

        overrides = function(colors)
          local theme = colors.theme
          return {
            -- Assign a static color to strings
            String = { fg = colors.palette.carpYellow, italic = true },
            -- theme colors will update dynamically when you change theme!
            SomePluginHl = { fg = colors.theme.syn.type, bold = true },

            ['@markup.heading.1.markdown'] = { fg = colors.palette.dragonPink },
            ['@markup.heading.2.markdown'] = { fg = colors.palette.lightBlue },
            ['@markup.heading.3.markdown'] = { fg = colors.palette.springGreen },
            ['@markup.heading.4.markdown'] = { fg = colors.palette.dragonOrange2 },
            --TelescopeTitle = { fg = theme.ui.special, bold = true },
            --TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            --TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            --TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            --TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            --TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            --TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
            --Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            --PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            --PmenuSbar = { bg = theme.ui.bg_m1 },
            --PmenuThumb = { bg = theme.ui.bg_p2 },
          }
        end,
      }

      -- Change color of headings
      vim.cmd.colorscheme 'kanagawa-dragon'
    end,
  },
  { 'navarasu/onedark.nvim' },
  { 'rose-pine/neovim', name = 'rose-pine' },
  {
    'catppuccin/nvim',
    name = 'catppuccin',

    config = function()
      require('catppuccin').setup {
        background = { light = 'latte', dark = 'mocha' }, -- latte, frappe, macchiato, mocha
        dim_inactive = {
          enabled = false,
          -- Dim inactive splits/windows/buffers.
          -- NOT recommended if you use old palette (a.k.a., mocha).
          shade = 'dark',
          percentage = 0.15,
        },
        transparent_background = false,
        show_end_of_buffer = false, -- show the '~' characters after the end of buffers
        term_colors = true,
        styles = {
          comments = { 'italic' },
          functions = { 'bold' },
          keywords = { 'italic' },
          operators = { 'bold' },
          conditionals = { 'bold' },
          loops = { 'bold' },
          booleans = { 'bold', 'italic' },
          numbers = {},
          types = {},
          strings = {},
          variables = {},
          properties = {},
        },
        integrations = {
          treesitter = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { 'italic' },
              hints = { 'italic' },
              warnings = { 'italic' },
              information = { 'italic' },
            },
            underlines = {
              errors = { 'underline' },
              hints = { 'underline' },
              warnings = { 'underline' },
              information = { 'underline' },
            },
          },
          aerial = true,
          alpha = false,
          barbar = false,
          beacon = false,
          cmp = true,
          coc_nvim = false,
          dap = true,
          dap_ui = true,
          dashboard = false,
          dropbar = { enabled = true, color_mode = true },
          fern = false,
          fidget = true,
          flash = true,
          gitgutter = false,
          gitsigns = true,
          harpoon = false,
          headlines = false,
          hop = true,
          illuminate = true,
          indent_blankline = { enabled = true, colored_indent_levels = false },
          leap = false,
          lightspeed = false,
          lsp_saga = true,
          lsp_trouble = true,
          markdown = true,
          mason = true,
          mini = false,
          navic = { enabled = false },
          neogit = false,
          neotest = false,
          neotree = { enabled = false, show_root = true, transparent_panel = false },
          noice = false,
          notify = true,
          nvimtree = true,
          overseer = false,
          pounce = false,
          rainbow_delimiters = true,
          render_markdown = true,
          sandwich = false,
          semantic_tokens = true,
          symbols_outline = false,
          telekasten = false,
          telescope = { enabled = true, style = nil },
          treesitter_context = true,
          ts_rainbow = false,
          vim_sneak = false,
          vimwiki = false,
          which_key = true,
        },
        color_overrides = {
          mocha = {
            -- CUSTOM:
            base = '#050517',

            -- DEFAULT mocha for reference:
            -- rosewater = "#f5e0dc",
            -- flamingo = "#f2cdcd",
            -- pink = "#f5c2e7",
            -- mauve = "#cba6f7",
            -- red = "#f38ba8",
            -- maroon = "#eba0ac",
            -- peach = "#fab387",
            -- yellow = "#f9e2af",
            -- green = "#a6e3a1",
            -- teal = "#94e2d5",
            -- sky = "#89dceb",
            -- sapphire = "#74c7ec",
            -- blue = "#89b4fa",
            -- lavender = "#b4befe",
            -- text = "#cdd6f4",
            -- subtext1 = "#bac2de",
            -- subtext0 = "#a6adc8",
            -- overlay2 = "#9399b2",
            -- overlay1 = "#7f849c",
            -- overlay0 = "#6c7086",
            -- surface2 = "#585b70",
            -- surface1 = "#45475a",
            -- surface0 = "#313244",
            -- base = "#1e1e2e",
            -- mantle = "#181825",
            -- crust = "#11111b",
          },
        },
        highlight_overrides = {
          ---@param cp palette
          all = function(cp)
            return {
              -- For base configs
              --CursorLineNr = { fg = cp.green },

              -- For native lsp configs
              --DiagnosticVirtualTextError = { bg = cp.none },
              --DiagnosticVirtualTextWarn = { bg = cp.none },
              --DiagnosticVirtualTextInfo = { bg = cp.none },
              --DiagnosticVirtualTextHint = { bg = cp.none },
              --LspInfoBorder = { link = "FloatBorder" },

              ---- For mason.nvim
              --MasonNormal = { link = "NormalFloat" },

              ---- For indent-blankline
              --IblIndent = { fg = cp.surface0 },
              --IblScope = { fg = cp.surface2, style = { "bold" } },

              ---- For nvim-cmp and wilder.nvim
              PmenuSel = { bg = cp.green, fg = cp.base },
              CmpItemAbbr = { fg = cp.overlay2 },
              CmpItemAbbrMatch = { fg = cp.blue, style = { 'bold' } },
              CmpDoc = { link = 'NormalFloat' },

              ---- For fidget
              --FidgetTask = { bg = cp.none, fg = cp.surface2 },
              --FidgetTitle = { fg = cp.blue, style = { "bold" } },

              ---- For nvim-notify
              --NotifyBackground = { bg = cp.base },

              ---- For nvim-tree
              --NvimTreeRootFolder = { fg = cp.pink },
              --NvimTreeIndentMarker = { fg = cp.surface2 },

              ---- For trouble.nvim
              --TroubleNormal = { bg = transparent_background and cp.none or cp.base },
              --TroubleNormalNC = { bg = transparent_background and cp.none or cp.base },

              ---- For telescope.nvim
              ----TelescopeMatching = { fg = cp.lavender },
              ----TelescopeResultsDiffAdd = { fg = cp.green },
              ----TelescopeResultsDiffChange = { fg = cp.yellow },
              ----TelescopeResultsDiffDelete = { fg = cp.red },

              ---- For glance.nvim
              --GlanceWinBarFilename = { fg = cp.subtext1, style = { "bold" } },
              --GlanceWinBarFilepath = { fg = cp.subtext0, style = { "italic" } },
              --GlanceWinBarTitle = { fg = cp.teal, style = { "bold" } },
              --GlanceListCount = { fg = cp.lavender },
              --GlanceListFilepath = { link = "Comment" },
              --GlanceListFilename = { fg = cp.blue },
              --GlanceListMatch = { fg = cp.lavender, style = { "bold" } },
              --GlanceFoldIcon = { fg = cp.green },

              WhichKeyFloat = { bg = '#0f0f24' },
              WhichKeyBorder = { bg = '#89b4fa' },
              LazyNormal = { bg = '#050517' },
              --TroubleNormal = { bg = "" },
              --MasonNormal = { bg = "#050517" },
              NormalFloat = { bg = cp.base },
              FloatBorder = { bg = cp.base },
              Normal = { bg = '#0e0e16' },

              -- For nvim-treehopper
              TSNodeKey = {
                fg = cp.peach,
                bg = transparent_background and cp.none or cp.base,
                style = { 'bold', 'underline' },
              },

              -- For treesitter
              ['@keyword.return'] = { fg = cp.pink, style = clear },
              ['@error.c'] = { fg = cp.none, style = clear },
              ['@error.cpp'] = { fg = cp.none, style = clear },
            }
          end,
        },
      }
      -- vim.cmd.colorscheme "catppuccin"
    end,
  },
}
