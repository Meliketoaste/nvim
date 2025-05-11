local signs = {
  [vim.diagnostic.severity.ERROR] = '󰅚 ',
  [vim.diagnostic.severity.WARN] = '󰀪 ',
  [vim.diagnostic.severity.INFO] = '󰋽 ',
  [vim.diagnostic.severity.HINT] = '󰌶 ',
}

---@type LazySpec
return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>F',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true, markdown = true }
        if not disable_filetypes[vim.bo[bufnr].filetype] then
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- python = { "isort", "black" },
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      { 'mason-org/mason-lspconfig.nvim', opts = {} },
      { 'WhoIsSethDaniel/mason-tool-installer.nvim', opts = {} },
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          vim.keymap.set('n', 'gd', require('fzf-lua').lsp_definitions, { desc = '[G]oto [D]efinition' })
          vim.keymap.set('n', 'gr', require('fzf-lua').lsp_references, { desc = '[G]oto [R]eferences' })
          vim.keymap.set('n', 'gI', require('fzf-lua').lsp_implementations, { desc = '[G]oto [I]mplementation' })
          vim.keymap.set('n', '<leader>D', require('fzf-lua').lsp_typedefs, { desc = 'Type [D]efinition' })
          vim.keymap.set('n', '<leader>ds', require('fzf-lua').lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
          vim.keymap.set('n', '<leader>ws', require('fzf-lua').lsp_live_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })
          vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
          vim.keymap.set({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })

          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            vim.keymap.set('n', '<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, { desc = '[T]oggle Inlay [H]ints' })
          end
        end,
      })

      -- See :help vim.diagnostic.Opts
      vim.diagnostic.config {
        float = { border = 'single', source = 'if_many' },
        signs = false,
        virtual_text = {
          spacing = 1,
          prefix = '',
          suffix = ' ',
          format = function(diagnostic)
            return signs[diagnostic.severity] .. ' ' .. diagnostic.message
          end,
        },
      }

      local servers = {
        -- clangd = {},
        -- gopls = {},
        -- pyright = {},
        -- rust_analyzer = {},
        -- ts_ls = {},

        lua_ls = {
          cmd = { 'lua-language-server' },
          filetypes = { 'lua' },
          root_markers = {
            '.luarc.json',
            '.luarc.jsonc',
            '.luacheckrc',
            '.stylua.toml',
            'stylua.toml',
            'selene.toml',
            'selene.yml',
            '.git',
          },
          -- filetypes = { ... },
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
        ols = {
          name = 'odin',
          cmd = { '/home/main/ols/ols' },
          filetypes = { 'odin' },
        },
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua',
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      for server_name, config in pairs(servers) do
        vim.lsp.config(server_name, config)
      end
    end,
  },

  ---@type LazySpec
  {
    'folke/lazydev.nvim',
    cmd = { 'LazyDev' },
    ft = 'lua',

    opts = {
      library = {
        { 'lazy.nvim', words = { 'lazy', 'LazySpec', 'LazyKeys', 'LazyKeysSpec' } },
        { 'snacks.nvim', words = { 'Snacks' }, ft = 'lua' },
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
    dependencies = {
      { 'Bilal2453/luvit-meta', lazy = true },
    },
  },
}
