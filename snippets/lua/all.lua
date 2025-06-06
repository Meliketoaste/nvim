local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local c = ls.choice_node
local i = ls.insert_node

local fmt = require('luasnip.extras.fmt').fmt
return {
  s(
    'todo',
    c(1, {
      t 'TODO',
      sn(0, {
        t 'TODO(',
        i(1, 'ivo'),
        t ')',
      }),
    })
  ),
  s({
    trig = 'dhis',
    name = 'dhis2',
    desc = 'DHIS2 acronym correctly spelled',
  }, {
    t 'DHIS2',
  }),

  s({
    trig = 'sfor', -- Trigger text (e.g., type 'sfor' and press Tab)
    name = 'SolidJS For Loop',
    desc = 'SolidJS <For> component for rendering lists',
  }, {
    t '<For each={',
    i(1, 'items'), -- Placeholder for the array/signal to iterate over
    t '}>{(',
    i(2, 'item'), -- Placeholder for the current item in the loop
    t ', ',
    i(3, 'index'), -- Placeholder for the index (optional)
    t ') => (',
    sn(4, { -- Snippet node for the content of the loop
      t '\n  ',
      i(0), -- Final cursor position inside the loop body
      t '\n',
    }),
    t ')}</For>',
  }),
  -- A more advanced version that includes a key prop and a fallback
  s({
    trig = 'sforf', -- Trigger with fallback
    name = 'SolidJS For Loop with Fallback',
    desc = 'SolidJS <For> component with key and fallback',
  }, {
    t '<For each={',
    i(1, 'items'),
    t '} fallback={',
    sn(5, { -- Fallback content
      t '<p>No items found.</p>',
    }),
    t '}>{(',
    i(2, 'item'),
    t ', ',
    i(3, 'index'),
    t ') => (',
    sn(4, {
      t '\n  ',
      t '<div key={',
      f(function(args)
        return args[1]
      end, { i(2) }), -- Use the item as key by default
      t '}>',
      t '\n    ',
      i(0),
      t '\n  </div>',
      t '\n',
    }),
    t ')}</For>',
  }),
  s(
    'solidFor',
    fmt(
      [[
<For each={{{}}} fallback={{{}}}>
  {{(item, index) => (
    {}
  )}}
</For>
    ]],
      {
        i(1, 'props.items'), -- Placeholder for the 'each' prop
        i(2, '<div>Loading...</div>'), -- Placeholder for the 'fallback' prop
        i(0), -- Placeholder for the content within the loop
      }
    )
  ),
}
