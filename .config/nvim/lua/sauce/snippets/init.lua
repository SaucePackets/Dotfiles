local M = {}

local loaded = false

function M.setup()
	if loaded then
		return
	end
	loaded = true

	local ls = require("luasnip")
	local s = ls.snippet
	local i = ls.insert_node
	local fmt = require("luasnip.extras.fmt").fmt
	local rep = require("luasnip.extras").rep

	local loop_snippets = {
		s(
			"for",
			fmt(
				[[
for (let {} = 0; {} < {}.length; {}++) {{
  {}
}}
]],
				{
					i(1, "index"),
					rep(1),
					i(2, "items"),
					rep(1),
					i(0),
				}
			)
		),
		s(
			"fori",
			fmt(
				[[
for (let {} = 0; {} < {}.length; {}++) {{
  const {} = {}[{}]
  {}
}}
]],
				{
					i(1, "index"),
					rep(1),
					i(2, "items"),
					rep(1),
					i(3, "item"),
					rep(2),
					rep(1),
					i(0),
				}
			)
		),
		s(
			"forof",
			fmt(
				[[
for (const {} of {}) {{
  {}
}}
]],
				{
					i(1, "item"),
					i(2, "items"),
					i(0),
				}
			)
		),
		s(
			"forin",
			fmt(
				[[
for (const {} in {}) {{
  {}
}}
]],
				{
					i(1, "key"),
					i(2, "object"),
					i(0),
				}
			)
		),
		s(
			"fn",
			fmt(
				[[
function {}({}) {{
  {}
}}
]],
				{
					i(1, "name"),
					i(2),
					i(0),
				}
			)
		),
		s(
			"afn",
			fmt(
				[[
const {} = ({}) => {{
  {}
}}
]],
				{
					i(1, "name"),
					i(2),
					i(0),
				}
			)
		),
		s(
			"if",
			fmt(
				[[
if ({}) {{
  {}
}}
]],
				{
					i(1, "condition"),
					i(0),
				}
			)
		),
		s(
			"clg",
			fmt(
				[[
console.log({})
]],
				{
					i(1, "value"),
				}
			)
		),
		s(
			"imp",
			fmt(
				[[
import {{ {} }} from "{}"
]],
				{
					i(1, "name"),
					i(2, "module"),
				}
			)
		),
	}

	for _, filetype in ipairs({ "javascript", "javascriptreact", "typescript", "typescriptreact" }) do
		ls.add_snippets(filetype, loop_snippets, { key = "sauce-js-ts-loops" })
	end
end

return M
