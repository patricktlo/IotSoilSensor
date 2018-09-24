(TeX-add-style-hook
 "ufpr"
 (lambda ()
   (TeX-run-style-hooks
    "leqno"
    "fleqn")
   (TeX-add-symbols
    '("descriptionlabel" 1)
    "makecapaproposta"
    "makerosto"
    "makecapadissertacao"
    "maketermo"
    "makededication"
    "part"
    "chapter"
    "section"
    "subsection"
    "subsubsection"
    "paragraph"
    "subparagraph"
    "appendix"
    "rm"
    "sf"
    "tt"
    "bf"
    "it"
    "sl"
    "sc"
    "cal"
    "mit"
    "tableofcontents"
    "l"
    "listoffigures"
    "listoftables"
    "bibindent"
    "newblock"
    "subitem"
    "subsubitem"
    "indexspace"
    "contentsname"
    "listfigurename"
    "listtablename"
    "bibname"
    "indexname"
    "figurename"
    "tablename"
    "partname"
    "chaptername"
    "appendixname"
    "abstractname"
    "chaptermark"
    "sectionmark"
    "advisortitle"
    "advisorname"
    "coadvisortitle"
    "coadvisorname"
    "advisorplace"
    "banca"
    "concentrationarea"
    "dedication"
    "city"
    "year"
    "defesa"
    "makelabel"
    "item"
    "today")
   (LaTeX-add-environments
    '("thebibliography" 1)
    "description"
    "abstract"
    "verse"
    "quotation"
    "quote"
    "titlepage"
    "figure"
    "table"
    "theindex")
   (LaTeX-add-pagestyles
    "headings"
    "myheadings")
   (LaTeX-add-counters
    "part"
    "chapter"
    "section"
    "subsection"
    "subsubsection"
    "paragraph"
    "subparagraph"
    "figure"
    "table")
   (LaTeX-add-lengths
    "abovecaptionskip"
    "belowcaptionskip"))
 :latex)

