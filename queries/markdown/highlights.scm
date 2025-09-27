
; Match shortcode start or end line inside a paragraph
((paragraph) @function
  (#match? @function "\\{\\{<\\s*/?cv-experience\\b[^}]*>\\}\\}"))

; Optionally match any shortcode
((paragraph) @function
  (#match? @function "\\{\\{<\\s*/?[a-zA-Z0-9_-]\\+[^}]*>\\}\\}"))

