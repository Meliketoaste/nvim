local function wrap_text(text)
  local lines, current_line = {}, ''
  local textwidth = vim.api.nvim_get_option_value('textwidth', { scope = 'local' }) -- 'tw' for textwidth
  textwidth = textwidth == 0 and 80 or textwidth

  for word in text:gmatch '%S+' do
    if current_line ~= '' and #current_line + #word + 1 > textwidth then
      table.insert(lines, current_line)
      current_line = word
    else
      current_line = current_line .. (current_line == '' and '' or ' ') .. word
    end
  end
  if current_line ~= '' then
    table.insert(lines, current_line)
  end
  return lines
end

local sentence_text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
local paragraph_text =
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'

return {
  'L3MON4D3/LuaSnip',
  config = function()
    local ls = require 'luasnip'
    local fmt = require('luasnip.extras.fmt').fmt

    ls.add_snippets('all', {
      ls.s({
        trig = 'lorem',
        name = 'Lorem Ipsum sentence',
        dscr = 'Insert Lorem Ipsum sentence',
      }, {
        ls.f(function()
          return wrap_text(sentence_text)
        end),
      }),

      ls.s({
        trig = 'loremP',
        name = 'Lorem Ipsum Paragraph',
        dscr = 'Insert Lorem Ipsum Paragraph',
      }, {
        ls.f(function()
          return wrap_text(paragraph_text)
        end),
      }),
    })

    ls.add_snippets('typescriptreact', {
      ls.s(
        '<For',
        fmt(
          [[
<For each={{{}}}>
  {{(item, index) => (
    {}
  )}}
</For>
]],
          { ls.i(1, 'props.items'), ls.i(0) }
        )
      ),

      ls.s(
        '<ForSu',
        fmt(
          [[
<Suspense fallback={{<div>loading...</div>}}>
<For each={{{}}}>
  {{(item, index) => (
    {}
  )}}
</For>
</Suspense>
]],
          { ls.i(1, 'props.items'), ls.i(0) }
        )
      ),

      ls.s(
        'cstore',
        fmt('const [{}, {}] = createStore({{{}}});\n', {
          ls.insert_node(1),
          ls.function_node(function(args)
            local name = args[1][1]
            local first = string.upper(string.sub(name, 1, 1))
            local rest = string.sub(name, 2, -1)
            return 'set' .. first .. rest
          end, { 1 }),
          ls.insert_node(2),
        })
      ),

      ls.s(
        'csig',
        fmt('const [{}, {}] = createSignal({});\n', {
          ls.insert_node(1),
          ls.function_node(function(args)
            local name = args[1][1]
            local first = string.upper(string.sub(name, 1, 1))
            local rest = string.sub(name, 2, -1)
            return 'set' .. first .. rest
          end, { 1 }),
          ls.insert_node(2),
        })
      ),
    })
  end,
}
