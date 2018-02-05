(TeX-add-style-hook
 "Plot_pdf"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt" "a4paper")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("geometry" "left=20mm" "right=20mm" "top=20mm" "bottom=20mm") ("natbib" "authoryear" "round" "longnamesfirst")))
   (add-to-list 'LaTeX-verbatim-environments-local "alltt")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art12"
    "geometry"
    "graphicx"
    "color"
    "alltt"
    "natbib"
    "hyperref"
    "verbatim"
    "shortvrb")
   (TeX-add-symbols
    '("email" 1)
    "E"
    "VAR"
    "COV"
    "p"
    "ui"
    "oi")
   (LaTeX-add-environments
    "smallexample")
   (LaTeX-add-color-definecolors
    "Red"
    "Blue"
    "hellgrau"))
 :latex)

