local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- 📸 Figure snippet
  s("cfig", {
    t({"\\begin{figure}[htb]", "    \\caption{"}),
    i(1, "Title"),
    t({"}", "    \\centering", "    \\includegraphics[width="}),
    i(2, "0.8"),
    t({"\\textwidth]{"}),
    i(3, "path/to/image"),
    t({"}", "    \\label{"}),
    i(4, "fig:label"),
    t({"}", "\\end{figure}"}),
  }),

  -- 📊 Table snippet
  s("ctab", {
    t({"\\begin{table}[htbp]", "    \\centering", "    \\caption{"}),
    i(1, "Title"),
    t({"}", "    \\label{"}),
    i(2, "tab:label"),
    t({"}", "    \\begin{tabular}{"}),
    i(3, "lcr"), -- columns
    t({"}", "        "}),
    i(4, "Content"),
    t({"", "    \\end{tabular}", "\\end{table}"}),
  }),

  -- 📝 Table with notes
  s("ctabn", {
    t({"\\begin{table}[htbp]", "    \\centering", "    \\caption{"}),
    i(1, "Title"),
    t({"}", "    \\label{"}),
    i(2, "tab:label"),
    t({"}", "    \\begin{tabular}{"}),
    i(3, "lcr"),
    t({"}", "        "}),
    i(4, "Content"),
    t({"", "    \\end{tabular}", "", "    \\vspace{0.5em}", "", "    \\begin{minipage}{0.8\\linewidth}", "        \\footnotesize"}),
    i(5, "Notes go here."),
    t({"", "    \\end{minipage}", "\\end{table}"}),
  }),
}
