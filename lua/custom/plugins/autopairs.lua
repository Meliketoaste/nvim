local has_value = function(tab, val)
  for _, value in ipairs(tab) do
    return value == val and true
  end
  return false
end

local get_closing_for_line = function(line)
  if vim.fn.col '.' ~= vim.fn.col '$' then
    return ''
  end

  local bracket_pairs = {
    ['{'] = '}',
    ['('] = ')',
    ['['] = ']',
  }
  local stack = {}

  for i = 1, #line do
    local char = string.sub(line, i, i)
    local closing_pair = bracket_pairs[char]

    if closing_pair then -- Opening bracket
      table.insert(stack, closing_pair)
    elseif string.find('}])', char) then -- Closing bracket
      if #stack == 0 or table.remove(stack) ~= char then
        return '' -- Mismatched or extra closing bracket
      end
    end
  end

  return table.concat(stack)
end
return {
  --  { 'rstacruz/vim-closer' },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',

    opts = {
      check_ts = true,
      map_bs = false,
      enable_moveright = false,
      enable_afterquote = false,
    },

    config = function(_, opts)
      local autopairs = require 'nvim-autopairs'
      local Rule = require 'nvim-autopairs.rule'

      autopairs.setup(opts)

      autopairs.remove_rule '"'
      autopairs.remove_rule '`'
      autopairs.remove_rule "'"

      autopairs.remove_rule '('
      autopairs.remove_rule '{'
      autopairs.remove_rule '['

      local pairs = { '"""', '```' }
      for _, rule in ipairs(autopairs.config.rules) do
        if has_value(pairs, rule.start_pair) then
          rule:end_wise()
        end
      end

      autopairs.add_rule(Rule('[%(%{%[]', '')
        :use_regex(true)
        :replace_endpair(function(o)
          return get_closing_for_line(o.line)
        end)
        :end_wise(function(o)
          return get_closing_for_line(o.line) ~= ''
        end))
    end,
  },
}
