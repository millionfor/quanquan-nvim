"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.vue,*.js,*.ts,*.sh,*.css exec ":call SetTitle()" 

""定义函数SetTitle，自动插入文件头 

func UpdateTitle()
    normal m'
    execute '/* @Last Modified\s*:/s@:.*$@\=strftime(":  %Y-%m-%d %H:%M %A")@'
endfunc

func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'vue' 
  " call setline(1,"\#########################################################################") 
  " call append(line("."), "\# File Name: ".expand("%")) 
  " call append(line(".")+1, "\# Description: ") 
  " call append(line(".")+2, "\# Author: chu") 
  " call append(line(".")+3, "\# Mail: ) 
  " call append(line(".")+4, "\# Created_Time: ".strftime("%Y-%m-%d %H:%M:%S")) 
  " call append(line(".")+5, "\# Last modified: ".strftime("%Y-%m-%d %H:%M:%s"))
  " call append(line(".")+6, "\#########################################################################") 
  " call append(line(".")+7, "\#!/bin/bash") 
  " call append(line(".")+8, "") 

		call setline(1,"<template>") 
		call append(line("."), "  <div :class=\"\classes\"\>") 
		call append(line(".")+1, "    ") 
		call append(line(".")+2, "  </div>") 
		call append(line(".")+3, "</template>") 
		call append(line(".")+4, "<script>") 
		call append(line(".")+5, "const prefixCls = 'vi-".expand("%:t:r") . "'") 
		call append(line(".")+6, "export default {") 
		call append(line(".")+7, "  name: 'Vi".expand("%:t:r") . "'," ) 
		call append(line(".")+8, "  data() {") 
		call append(line(".")+9, "    return {}") 
		call append(line(".")+10, "  },") 
		call append(line(".")+11, "  props: {},") 
		call append(line(".")+12, "  methods: {},") 
		call append(line(".")+13, "  watch: {},") 
		call append(line(".")+14, "  created() {},") 
		call append(line(".")+15, "  mounted() {},") 
		call append(line(".")+16, "  computed: {") 
    call append(line(".")+17, "    classes() {") 
    call append(line(".")+18, "      return [") 
    call append(line(".")+19, "        `${ prefixCls }`") 
    call append(line(".")+20, "	     ]") 
    call append(line(".")+21, "	   }") 
    call append(line(".")+22, "  },") 
    call append(line(".")+23, "  components: {}") 
    call append(line(".")+24, "}") 
    call append(line(".")+25, "</script>") 
    call append(line(".")+26, "<style lang=\"\scss\"\ rel=\"\stylesheet/scss\"\>") 
    call append(line(".")+27, "$-prefix-cls: 'vi-".expand("%:t:r") . "';") 
    call append(line(".")+28, ".#{$-prefix-cls} {") 
    call append(line(".")+29, "}") 
    call append(line(".")+30, "</style>") 
    call append(line(".")+31, "<!-- vim: set ft=vue ff=unix et sw=2 ts=2 sts=2 tw=150: -->") 
	elseif &filetype == 'javascript' 
		call setline(1, "/**") 
		call append(line("."),  " * @File Name       ".expand("%:t:r")) 
		call append(line(".")+1, " * @Created Time    ".strftime("%Y-%m-%d %I:%M") . " ".strftime("%A")) 
    call append(line(".")+2, " * @Last Modified:  ".strftime("%Y-%m-%d %H:%M %A"))
		call append(line(".")+3, " * @Author          QuanQuan <millionfor@apache.org>") 
		call append(line(".")+4, " * @Description     x") 
		call append(line(".")+5, " */") 
	elseif &filetype == 'typescript' 
		call setline(1, "/**") 
		call append(line("."),  " * @File Name       ".expand("%:t:r")) 
		call append(line(".")+1, " * @Created Time    ".strftime("%Y-%m-%d %I:%M") . " ".strftime("%A")) 
    call append(line(".")+2, " * @Last Modified:  ".strftime("%Y-%m-%d %H:%M %A"))
		call append(line(".")+3, " * @Author          QuanQuan <millionfor@apache.org>") 
		call append(line(".")+4, " * @Description     x") 
		call append(line(".")+5, " */") 

	else 
		call setline(1, "/*************************************************************************2") 
		call append(line("."),  "  * File Name: ".expand("%")) 
		call append(line(".")+1, "  * Description: ") 
		call append(line(".")+2, "  * Author: chu") 
		call append(line(".")+3, "  * Mail: ") 
		call append(line(".")+4, "  * Created_Time: ".strftime("%Y-%m-%d %X")) 
		call append(line(".")+5, "  * Last modified: ".strftime("%Y-%m-%d %X")) 
		call append(line(".")+6, " ************************************************************************/") 
		call append(line(".")+7, "")
	endif
	
"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc
 
"""""""""""""""""""""""""""""""""""""""""
""实现上面函数中的，Last modified功能
"""""""""""""""""""""""""""""""""""""""""
autocmd BufWrite,BufWritePre,FileWritePre  *.vue,*.js,*.ts,*.sh,*.css    ks|call LastModified()|'s  
func LastModified()
  let n=1
  while n<7
    let line = getline(n)
    if line =~ '^\s*\*\s*@Last\sModified\s*\S*.*$'
      call UpdateTitle()
      return
    endif
    let n = n+1
  endwhile
endfunc
""""""""""""""""""""

