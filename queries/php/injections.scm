; Match assignments to variables named $sql or ending with _sql or _query
(assignment_expression
  left: (variable_name) @sql_var
    (#match? @sql_var "^(\\$sql|\\$.+_(query|sql))$")
  right: (string) @injection.content
    (#set! injection.language "sql"))

; Optionally, match assignments with concatenated SQL (string + variable or string . variable)
(assignment_expression
  left: (variable_name) @sql_var
    (#match? @sql_var "^(\\$sql|\\$.+_(query|sql))$")
  right: (binary_expression
           left: (string) @injection.content
           operator: ('.' | '+')
           right: (_))
    (#set! injection.language "sql"))

; Match SQL in function calls like mysqli_query($conn, $sql)
(function_call_expression
  function: (name) @func
    (#match? @func "^(mysqli_query|pg_query|pdo->query|pdo->prepare)$")
  arguments: (arguments
               (variable_name) @sql_var
                 (#match? @sql_var "^(\\$sql|\\$.+_(query|sql))$")
               )
  )

; Match SQL in function calls directly in the argument
(function_call_expression
  function: (name) @func
    (#match? @func "^(mysqli_query|pg_query|pdo->query|pdo->prepare)$")
  arguments: (arguments
               (string) @injection.content
                 (#set! injection.language "sql"))
)

; Optionally, match heredoc/nowdoc (if you use those)
(assignment_expression
  left: (variable_name) @sql_var
    (#match? @sql_var "^(\\$sql|\\$.+_(query|sql))$")
  right: (heredoc) @injection.content
    (#set! injection.language "sql")
)
