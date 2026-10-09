local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	s(
		{ trig = "sec", desc = "Section", snippetType = "autosnippet" },
		fmta("= <>", { i(1) }),
		{ condition = line_begin }
	),

	s(
		{ trig = "ssec", desc = "Subsection", snippetType = "autosnippet" },
		fmta("== <>", { i(1) }),
		{ condition = line_begin }
	),

	s(
		{ trig = "sssec", desc = "Subsubsection", snippetType = "autosnippet" },
		fmta("=== <>", { i(1) }),
		{ condition = line_begin }
	),

	s({ trig = "mm", desc = "Inline maths", snippetType = "autosnippet" }, fmta("$<>$", { i(1) })),

	s({ trig = "MM", desc = "Display maths", snippetType = "autosnippet" }, fmta("$ <> $", { i(1) })),

	s(
		{ trig = "code", desc = "Code block", snippetType = "autosnippet" },
		fmta(
			[[

        #linebreak()
        ```<>
        <>
        ```

        ]],
			{ i(1, "python"), i(2) }
		),
		{ condition = line_begin }
	),

	s({ trig = "tsc", desc = "small caps", snippetType = "autosnippet" }, fmta("#smallcaps[<>]", { i(1) })),

	s({ trig = "tbf", desc = "bold", snippetType = "autosnippet" }, fmta("#strong[<>]", { i(1) })),

	s({ trig = "tit", desc = "italic" }, fmta("#emph[<>]", { i(1) })),
}
