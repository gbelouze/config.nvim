local M = require("custom.snippet_helpers")
local in_between_dollars = M.in_between_dollars

return {
	s({
		trig = ";inf",
		desc = "infinity",
		snippetType = "autosnippet",
	}, {
		t("∞"),
	}, { condition = in_between_dollars }),

	s({
		trig = ";st",
		desc = "such that",
		snippetType = "autosnippet",
	}, {
		t("|"),
	}, { condition = in_between_dollars }),

	s({
		trig = ";fa",
		desc = "forall",
		snippetType = "autosnippet",
	}, {
		t("∀"),
	}, { condition = in_between_dollars }),

	s({
		trig = ";ex",
		desc = "exists",
		snippetType = "autosnippet",
	}, {
		t("∃"),
	}, { condition = in_between_dollars }),


	s({
		trig = ";a",
		snippetType = "autosnippet",
		wordTrig = false,
	}, {
		t("α"),
	}, { condition = in_between_dollars }),

	s({
		trig = ";b",
		snippetType = "autosnippet",
		wordTrig = false,
	}, {
		t("β"),
	}, { condition = in_between_dollars }),

	s({
		trig = ";g",
		snippetType = "autosnippet",
		wordtrig = false,
	}, {
		t("γ"),
	}, { condition = in_between_dollars }),

	s({
		trig = ";d",
		snippetType = "autosnippet",
		wordtrig = false,
	}, {
		t("δ"),
	}, { condition = in_between_dollars }),

	s({
		trig = ";e",
		snippetType = "autosnippet",
		wordtrig = false,
	}, {
		t("ε"),
	}, { condition = in_between_dollars }),

	s({
		trig = ";p",
		snippetType = "autosnippet",
		wordTrig = false,
	}, {
		t("ψ"),
	}, { condition = in_between_dollars }),

	s({
		trig = ";f",
		snippetType = "autosnippet",
		wordTrig = false,
	}, {
		t("φ"),
	}, { condition = in_between_dollars }),

	s({
		trig = ";m",
		snippetType = "autosnippet",
		wordTrig = false,
	}, {
		t("μ"),
	}, { condition = in_between_dollars }),

	s({
		trig = ";n",
		snippetType = "autosnippet",
		wordTrig = false,
	}, {
		t("ν"),
	}, { condition = in_between_dollars }),

	s({
		trig = ";o",
		snippetType = "autosnippet",
		wordTrig = false,
	}, {
		t("ω"),
	}, { condition = in_between_dollars }),

	s({
		trig = ";s",
		snippetType = "autosnippet",
		wordtrig = false,
	}, {
		t("σ"),
	}, { condition = in_between_dollars }),

	s({
		trig = ";h",
		snippetType = "autosnippet",
		wordtrig = false,
	}, {
		t("θ"),
	}, { condition = in_between_dollars }),

	s({
		trig = ";l",
		snippetType = "autosnippet",
		wordtrig = false,
	}, {
		t("λ"),
	}, { condition = in_between_dollars }),

	s({
		trig = ";r",
		snippetType = "autosnippet",
		wordtrig = false,
	}, {
		t("ρ"),
	}, { condition = in_between_dollars }),

	s({
		trig = ";t",
		snippetType = "autosnippet",
		wordtrig = false,
	}, {
		t("τ"),
	}, { condition = in_between_dollars }),

	s({
		trig = ";y",
		snippetType = "autosnippet",
		wordTrig = false,
	}, {
		t("π"),
	}, { condition = in_between_dollars }),

	s(
		{ trig = "__", snippetType = "autosnippet", wordTrig = false },
		fmta(
			"_(<>)",
			{ i(1) }
		),
		{ condition = in_between_dollars }
	),

	s(
		{ trig = "^^", snippetType = "autosnippet", wordTrig = false },
		fmta(
			"^(<>)",
			{ i(1) }
		),
		{ condition = in_between_dollars }
	),

	s(
		{ trig = ";sum", desc = "sum", snippetType = "autosnippet" },
		fmta(
			"#sum_(k=<>)^(<>) <>",
			{ i(1, "0"), i(2, "n"), i(3) }
		),
		{ condition = in_between_dollars }
	),

	s(
		{ trig = ";prod", desc = "prod", snippetType = "autosnippet" },
		fmta(
			"product_(k=<>)^(<>) <>",
			{ i(1, "0"), i(2, "n"), i(3) }
		),
		{ condition = in_between_dollars }
	),

	s(
		{ trig = ";ff", desc = "frac", snippetType = "autosnippet" },
		fmta(
			"(<>) / (<>)",
			{ i(1, "1"), i(2, "2") }
		),
		{ condition = in_between_dollars }
	),

	s(
		{ trig = ";sqrt", desc = "sqrt", snippetType = "autosnippet" },
		fmta("sqrt(<>)", { i(1, "x") }),
		{ condition = in_between_dollars }
	),

	s(
		{ trig = ";int", desc = "integral", snippetType = "autosnippet" },
		fmta(
			"integral_(<>)^(<>) <> d<>",
			{ i(1, "a"), i(2, "b"), i(3, "f(t)"), i(4, "t") }
		),
		{ condition = in_between_dollars }
	),

	s(
		{ trig = ";ee", desc = "e^", snippetType = "autosnippet" },
		fmta("e^(<>)", { i(1, "x") }),
		{ condition = in_between_dollars }
	),
}
