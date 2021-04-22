au BufNewFile,BufRead *.html,*.js,*.vue,*.ts set tabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue,*.ts set softtabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue,*.ts set shiftwidth=2
au BufNewFile,BufRead *.html,*.js,*.vue,*.ts set expandtab
au BufNewFile,BufRead *.html,*.js,*.vue,*.ts set autoindent
au BufNewFile,BufRead *.html,*.js,*.vue,*.ts set fileformat=unix

autocmd FileType typescript setlocal et sta sw=2 sts=2

autocmd FileType javascriptreact setlocal et sta sw=2 sts=2

autocmd FileType vue syntax sync fromstart


let g:syntastic_javascript_checkers = ['eslint']


let g:oscyank_max_length = 1000000
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | OSCYankReg " | endif
































" def CamelToSneak(name: string): string
"   var l = []
"   var start = true
"   for ch in split(name, '\zs')
"     if ch =~# '\u'
"       l->add('_')
"     endif
"     l->add(tolower(ch))
"   endfor
"   var i = 0
"   while l[i] == '_'
"     i += 1
"   endw
"   return join(l[i :], '')
" enddef

" def SneakToCamel(name: string): string
"   var ret = ''
"   var pre_underscore = true
"   for ch in split(name, '\zs')
"     if ch == '_'
"       pre_underscore = true
"       continue
"     endif
"     if pre_underscore
"       ret ..= toupper(ch)
"       pre_underscore = false
"     else
"       ret ..= ch
"     endif
"   endfor
"   return ret
" enddef

" def Convert(name: string): string
"   return stridx(name, "_") == -1 ? CamelToSneak(name) : SneakToCamel(name)
" enddef

" def ConvertCword(all: bool=false)
"   var cword = expand("<cword>")
"   var pos = getcurpos()
"   if all
"     exec printf('g/\<%s\>/s/\<%s\>/%s/g', cword, cword, Convert(cword))
"   else
"     if has('clipboard')
"       var __save1 = getreg('+')
"       var __save2 = getreg('*')
"     endif
"     var __save3 = getreg('0')
"     setreg('0', Convert(cword))
"     norm! viw"0p
"     if has('clipboard')
"       setreg('+', __save1)
"       setreg('*', __save2)
"     endif
"     setreg('0', __save3)
"   endif
"   setpos('.', pos)
" enddef

" map w <cmd>call <sid>ConvertCword(1)<cr>
" map e <cmd>call <sid>ConvertCword()<cr>
