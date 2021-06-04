vnoremap <buffer><silent> = :!js-beautify -s 2 --space-in-empty-paren --space-after-anon-function -b collapse<cr>
nnoremap <buffer><silent> = :.!js-beautify -s 2 --space-in-empty-paren --space-after-anon-function -b collapse<cr>


" func GET_TEXT()
"   let begin = searchpos('\(\%V\@<!.\|^\)\%V', 'nw')
"   let end = searchpos('\%V.\%V\@!', 'nw')
"   if begin[0] == end[0]
"     let line = getline('.')
"     return strpart(line, begin[1], end[1]-begin[1])
"   endif
"   return ''
" endf

" vnoremap <silent><buffer> C :<c-u>call SurroundVaddPairs('console.log(`[logger-' . printf(GET_TEXT()) . '] =>  `,' , ")")<cr>


"
" func CONSOLE_LOG()
"     let tag = getline(line("."))[col("'<") - 1 : col("'>") - 1]
"     call SurroundVaddPairs(printf('console.log(`[logger-%s] => `, ', tag), ')')
" endf
" 
" vnoremap <silent><buffer> C :<c-u>call CONSOLE_LOG()<cr>
"


