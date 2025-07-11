---@param item snacks.picker.Item
function filename(item, picker)
  ---@type snacks.picker.Highlight[]
  local ret = {}
  if not item.file then
    return ret
  end
  local path = Snacks.picker.util.path(item) or item.file
  path = Snacks.picker.util.truncpath(path, picker.opts.formatters.file.truncate or 40, { cwd = picker:cwd() })
  local name, cat = path, 'file'
  if item.buf and vim.api.nvim_buf_is_loaded(item.buf) then
    name = vim.bo[item.buf].filetype
    cat = 'filetype'
  elseif item.dir then
    cat = 'directory'
  end

  if picker.opts.icons.files.enabled ~= false then
    local icon, hl = Snacks.util.icon(name, cat, {
      fallback = picker.opts.icons.files,
    })
    if item.dir and item.open then
      icon = picker.opts.icons.files.dir_open
    end
    icon = Snacks.picker.util.align(icon, picker.opts.formatters.file.icon_width or 2)
    ret[#ret + 1] = { icon, hl, virtual = true }
  end

  local base_hl = item.dir and 'SnacksPickerDirectory' or 'SnacksPickerFile'
  local function is(prop)
    local it = item
    while it do
      if it[prop] then
        return true
      end
      it = it.parent
    end
  end

  if is 'ignored' then
    base_hl = 'SnacksPickerPathIgnored'
  elseif is 'hidden' then
    base_hl = 'SnacksPickerPathHidden'
  elseif item.filename_hl then
    base_hl = item.filename_hl
  end
  local dir_hl = 'SnacksPickerDir'

  if picker.opts.formatters.file.filename_only then
    path = vim.fn.fnamemodify(item.file, ':t')
    ret[#ret + 1] = { path, base_hl, field = 'file' }
  else
    local dir, base = path:match '^(.*)/(.+)$'
    if base and dir then
      if picker.opts.formatters.file.filename_first then
        ret[#ret + 1] = { base, base_hl, field = 'file' }
        ret[#ret + 1] = { ' ' }
        ret[#ret + 1] = { dir, dir_hl, field = 'file' }
      else
        ret[#ret + 1] = { dir .. '/', dir_hl, field = 'file' }
        ret[#ret + 1] = { base, base_hl, field = 'file' }
      end
    else
      ret[#ret + 1] = { path, base_hl, field = 'file' }
    end
  end
  if item.pos and item.pos[1] > 0 then
    ret[#ret + 1] = { ':', 'SnacksPickerDelim' }
    ret[#ret + 1] = { tostring(item.pos[1]), 'SnacksPickerRow' }
    if item.pos[2] > 0 then
      ret[#ret + 1] = { ':', 'SnacksPickerDelim' }
      ret[#ret + 1] = { tostring(item.pos[2]), 'SnacksPickerCol' }
    end
  end
  ret[#ret + 1] = { ' ' }
  if item.type == 'link' then
    local real = uv.fs_realpath(item.file)
    local broken = not real
    real = real or uv.fs_readlink(item.file)
    if real then
      ret[#ret + 1] = { '-> ', 'SnacksPickerDelim' }
      ret[#ret + 1] = { Snacks.picker.util.truncpath(real, 20), broken and 'SnacksPickerLinkBroken' or 'SnacksPickerLink' }
      ret[#ret + 1] = { ' ' }
    end
  end
  return ret
end

function severity(item, picker)
  local ret = {} ---@type snacks.picker.Highlight[]
  local severity = item.severity
  severity = type(severity) == 'number' and vim.diagnostic.severity[severity] or severity
  if not severity or type(severity) == 'number' then
    return ret
  end
  ---@cast severity string
  local lower = severity:lower()
  local cap = severity:sub(1, 1):upper() .. lower:sub(2)

  if picker.opts.formatters.severity.pos == 'right' then
    return {
      {
        col = 0,
        virt_text = { { picker.opts.icons.diagnostics[cap], 'Diagnostic' .. cap } },
        virt_text_pos = 'right_align',
        hl_mode = 'combine',
      },
    }
  end

  if picker.opts.formatters.severity.icons then
    ret[#ret + 1] = { picker.opts.icons.diagnostics[cap], 'Diagnostic' .. cap, virtual = true }
    ret[#ret + 1] = { ' ', virtual = true }
  end

  if picker.opts.formatters.severity.level then
    ret[#ret + 1] = { lower:upper(), 'Diagnostic' .. cap, virtual = true }
    ret[#ret + 1] = { ' ', virtual = true }
  end

  return ret
end

function notification(item, picker)
  local a = Snacks.picker.util.align
  local ret = {} ---@type snacks.picker.Highlight[]
  local notif = item.item ---@type snacks.notifier.Notif
  ret[#ret + 1] = { a(os.date('%R', notif.added), 5), 'SnacksPickerTime' }
  ret[#ret + 1] = { ' ' }
  if item.severity then
    vim.list_extend(ret, severity(item, picker))
  end
  ret[#ret + 1] = { ' ' }
  ret[#ret + 1] = { a(notif.title or '', 15), 'SnacksNotifierHistoryTitle' }
  ret[#ret + 1] = { ' ' }
  ret[#ret + 1] = { notif.msg, 'SnacksPickerNotificationMessage' }
  Snacks.picker.highlight.markdown(ret)
  -- ret[#ret + 1] = { " " }
  return ret
end
---
---@type LazySpec
return {
  { 'mfussenegger/nvim-fzy' },

  -- {
  --   'davidmh/mdx.nvim',
  --   config = true,
  --   dependencies = { 'nvim-treesitter/nvim-treesitter' },
  -- },
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@module 'snacks.nvim'
    ---@type snacks.Config
    opts = {
      statuscolumn = { enabled = false },

      bigfile = { enabled = true },

      picker = {
        enabled = true,
        sources = {
          -- diagnostics_buffer = {
          --   format = function(item, picker)
          --     local ret = {} ---@type snacks.picker.Highlight[]
          --     local diag = item.item ---@type vim.Diagnostic
          --     if item.severity then
          --       vim.list_extend(ret, severity(item, picker))
          --     end
          --
          --     local message = diag.message
          --     print(message)
          --     ret[#ret + 1] = { message }
          --     -- Snacks.picker.highlight.markdown(ret)
          --     -- ret[#ret + 1] = { ' ' }
          --     --
          --     -- if diag.source then
          --     --   ret[#ret + 1] = { diag.source, 'SnacksPickerDiagnosticSource' }
          --     --   ret[#ret + 1] = { ' ' }
          --     -- end
          --     --
          --     -- if diag.code then
          --     --   ret[#ret + 1] = { ('(%s)'):format(diag.code), 'SnacksPickerDiagnosticCode' }
          --     --   ret[#ret + 1] = { ' ' }
          --     -- end
          --     vim.list_extend(ret, filename(item, picker))
          --     return ret
          --   end,
          -- },

          command_history = {
            sort = { fields = { 'idx', 'score:desc' } },
          },
          image = {
            enabled = true,
            -- inline = false,
          },
          zen = { enabled = true },
          -- quickfile = { enabled = true },
          -- scope = { enabled = false },
          -- scroll = { enabled = false },
          words = { enabled = true },
        },
      },
    },
    keys = {
      { '<leader>sf', function() Snacks.picker.files { matcher = { frecency = true } } end, desc = '[S]earch [F]iles' },
      { '<leader>sg', function() Snacks.picker.grep() end, desc = '[S]earch [G]rep' },
      { '<leader>sb', function() Snacks.picker.buffers() end, desc = '[S]earch [B]uffers' },
      -- { '<leader>sd', function() Snacks.picker.diagnostics_buffer() end, desc = '[S]earch [B]uffers' },

      --   vim.keymap.set('n', '<leader>sd', fzf.diagnostics_document, { desc = '[S]earch [D]iagnostics Current-File' })
      { '<leader>:', function() Snacks.picker.command_history { layout = { preset = 'vertical', preview = false } } end, desc = '[:] Command History' },
      { '<leader>?', function() Snacks.picker() end, desc = '[?] Built-in' },
    },
  },
}
