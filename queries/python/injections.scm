; Match single-quoted SQL strings
(call
  (attribute
    object: (identifier) @object (#eq? @object "crs")
    attribute: (identifier) @attribute (#contains? @attribute "execute" "executemany"))
  (argument_list
    (string
      (string_content) @injection.content
        (#set! injection.language "sql"))))

; Match triple-quoted SQL strings (single or double quotes)
(call
  (attribute
    object: (identifier) @object (#eq? @object "crs")
    attribute: (identifier) @attribute (#contains? @attribute "execute" "executemany"))
  (argument_list
    (string
      (string_content) @injection.content
        (#match? @injection.content ".*")
        (#set! injection.language "sql"))))

;; Match assignments to variables using triple-quoted SQL
(assignment
  left: (identifier) @sql_var
    (#match? @sql_var ".*_(query|sql)$")
  right: (string
           (string_content) @injection.content
             (#set! injection.language "sql")))


(assignment
  left: (identifier) @sql_var
    (#match? @sql_var "^sql$")
  right: (string
           (string_content) @injection.content
             (#set! injection.language "sql")))
