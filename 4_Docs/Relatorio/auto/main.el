(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("ufpr" "12pt" "a4paper")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("babel" "brazil")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (TeX-run-style-hooks
    "latex2e"
    "agradecimentos"
    "siglas"
    "capitulo1"
    "capitulo2"
    "capitulo3"
    "crono"
    "ufpr"
    "ufpr12"
    "babel"
    "graphicx"
    "trivfloat"
    "listings"
    "color"
    "abntcite"
    "helvet")
   (TeX-add-symbols
    '("chav" 1)
    '("PC" 1)
    '("PR" 1)
    '("highlight" 1))
   (LaTeX-add-bibliographies
    "referencias")
   (LaTeX-add-color-definecolors
    "mygreen"
    "mylilas"
    "blue"))
 :latex)

