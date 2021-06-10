func CONSOLE_LOG()
    let tag = getline(line("."))[col("'<") - 1 : col("'>") - 1]
    let l = line('.')
    let space = substitute(getline(l), '\v(^\s*).*', '\1', '')
    call appendbufline('%', line('.'), printf(space . 'console.log(`[logger-%s] => `, %s)', tag, tag)) 
endf

vnoremap <silent><buffer> C :<c-u>call CONSOLE_LOG()<cr>
