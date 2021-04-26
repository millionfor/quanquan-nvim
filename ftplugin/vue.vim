

func CONSOLE_LOG()
    let tag = getline(line("."))[col("'<") - 1 : col("'>") - 1]
    call SurroundVaddPairs(printf('console.log(`[logger-%s] => `, ', tag), ')')
endf

vnoremap <silent><buffer> C :<c-u>call CONSOLE_LOG()<cr>

