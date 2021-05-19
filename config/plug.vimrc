" Plug
    call plug#begin('~/.config/nvim/plugged')
            Plug 'yianwillis/vimcdoc'
            Plug 'terryma/vim-expand-region'
            Plug 'lfv89/vim-interestingwords'
            Plug 'mg979/vim-visual-multi', {'branch': 'master'}
            Plug 'luochen1990/rainbow'
            Plug 'tpope/vim-dadbod'
            Plug 'kristijanhusak/vim-dadbod-ui', { 'on': ['DBUI'] }
            Plug 'pangloss/vim-javascript', {'for': ['javascript', 'vim-plug']}
            Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm i'  }
            Plug 'neoclide/coc.nvim', {'branch': 'release'}
            Plug 'voldikss/vim-floaterm' 
            Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
            Plug 'junegunn/fzf.vim'
            Plug 'yaocccc/vim-lines'
            Plug 'yaocccc/vim-surround'
            Plug 'yaocccc/vim-comment'
            Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
            Plug 'posva/vim-vue'
            Plug 'scrooloose/syntastic'
            Plug 'tpope/vim-dadbod'
            Plug 'kristijanhusak/vim-dadbod-ui', { 'on': ['DBUI'] }
            Plug 'ojroques/vim-oscyank', {'branch': 'main'}
        " vim 入口封面
            Plug 'mhinz/vim-startify'
        " NERDTree左侧树形目录
            Plug 'scrooloose/nerdtree'
        " nerdtree字体图标
            Plug 'ryanoasis/vim-devicons'
        " nerdtree 路径复制到剪切板
            Plug 'mortonfox/nerdtree-clip'
    call plug#end()

" Plug Setting
            vnoremap <leader>c :OSCYank<CR>
            let g:oscyank_max_length = 1000000
            autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | OSCYankReg " | endif
            autocmd TextYankPost * if v:event.operator is 'p' && v:event.regname is '+' | OSCYankReg + | endif

            autocmd FileType vue syntax sync fromstart
            " autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
            let g:vue_pre_processors = 'detect_on_enter'
    " 自定义按键
            nmap     <silent>       E         :call Tests("doHover")<cr>

            func Tests()
              call setline(1,"2222") 
            endfunc
    "  " T快速向下打开一个终端
           nnoremap T :below 10sp +term<cr>a
    " defx-icons 配置
            set encoding=UTF-8
    " scrooloose/nerdtree 设置目录树
            "NERDTree快捷键
            :nnoremap <F1> :NERDTree <cr>
            " 按<F2>打开或关闭文件目录树
            :nnoremap <F1> :NERDTreeToggle<cr>

            " 鼠标操作点击打开隐藏文件夹
            let NERDTreeMouseMode = 2
            " 显示隐藏文件 
            let NERDTreeShowHidden = 2
    " vim-startify 封面设置
            "设置书签
            let g:startify_bookmarks            = [
            \ '~/Project/test.cpp',
            \]
            "起始页显示的列表长度
            let g:startify_files_number = 14
            "自动加载session
            let g:startify_session_autoload = 1
            "过滤列表，支持正则表达式
            let g:startify_skiplist = [
            \ '^/tmp',
            \ ]
            "自定义Header和Footer
            "let g:startify_custom_header = [
            "\ '+------------------------------+',
            "\ '|                              |',
            "\ '|    Still waters run deep!    |',
            "\ '|                              |',
            "\ '+----------------+-------------+',
            "\]
            "
            let g:startify_custom_header = [
            \'                                              ____                     ____                      _____ _____  ______           ', 
            \'                                             / __ \                   / __ \                    |_   _|  __ \|  ____|   /\     ', 
            \'                                            | |  | |_   _  __ _ _ __ | |  | |_   _  __ _ _ __     | | | |  | | |__     /  \    ', 
            \'                                            | |  | | | | |/ _  |  _ \| |  | | | | |/ _  |  _ \    | | | |  | |  __|   / /\ \   ',
            \'                                            | |__| | |_| | (_| | | | | |__| | |_| | (_| | | | |  _| |_| |__| | |____ / ____ \  ',
            \'                                             \___\_\\__,_|\__,_|_| |_|\___\_\\__,_|\__,_|_| |_| |_____|_____/|______/_/    \_\ ',
            \]

            let g:startify_custom_footer = [
            \      '+------------------------------------+',
            \      '|    圈圈摄影 wwww.quanquansy.com    |',
            \      '+----------------+-------------------+',
            \]


    " coc-vim
        " 插件列表
            let g:coc_global_extensions=[
                \ 'coc-tsserver',
                \ 'coc-html', 'coc-css',
                \ 'coc-ccls', 'coc-clangd',
                \ 'coc-go',
                \ 'coc-vimlsp',
                \ 'coc-sh',
                \ 'coc-java',
                \ 'coc-json',
                \ 'coc-db',
                \ 'coc-pairs', 'coc-snippets', 'coc-tabnine',
                \ 'coc-word',  'coc-markdownlint',
                \ 'coc-translator', 'coc-explorer', 'coc-git'
                \ ]
        " maps
            nmap     <silent>       <F2>      <Plug>(coc-rename)
            nmap     <silent>       gd        <Plug>(coc-definition)
            nmap     <silent>       gy        <Plug>(coc-type-definition)
            nmap     <silent>       gi        <Plug>(coc-implementation)
            nmap     <silent>       gr        <Plug>(coc-references)
            nmap     <silent>       K         :call CocAction("doHover")<cr>
            nmap     <silent>       <c-e>     :<c-u>CocList diagnostics<cr>
            nnoremap <silent>       <F9>      :CocCommand snippets.editSnippets<cr>
            nnoremap <silent>       <F3>      :silent CocRestart<cr>
            nnoremap <silent><expr> <F4>      get(g:, 'coc_enabled', 0) == 1 ? ':CocDisable<cr>' : ':CocEnable<cr>'
            inoremap <silent><expr> <TAB>     pumvisible() ? "\<C-n>" : col('.') == 1 \|\| getline('.')[col('.') - 2] =~# '\s' ? "\<TAB>" : coc#refresh()
            inoremap <silent><expr> <s-tab>   pumvisible() ? "\<c-p>" : "\<s-tab>"
            inoremap <silent><expr> <cr>      pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
        " coc-translator
            nmap     <silent>       mm        <Plug>(coc-translator-p)
            vmap     <silent>       mm        <Plug>(coc-translator-pv)
        " coc-git
            nmap     <silent>       (         <Plug>(coc-git-prevchunk)
            nmap     <silent>       )         <Plug>(coc-git-nextchunk)
            vmap     <silent>       ig        <Plug>(coc-git-chunk-inner)
            vmap     <silent>       ag        <Plug>(coc-git-chunk-outer)
            nmap     <silent><expr> C         get(b:, 'coc_git_blame', '') ==# 'Not committed yet' ? "<Plug>(coc-git-chunkinfo)" : "<Plug>(coc-git-commit)"
            nmap     <silent>       <leader>g :call coc#config('git.addGBlameToVirtualText',  !get(g:coc_user_config, 'git.addGBlameToVirtualText', 0))<cr>
        " coc-explorer
            nnoremap <silent>       tt        :CocCommand explorer --preset floating<cr>
            au User CocExplorerOpenPre  hi Pmenu ctermbg=NONE
            au User CocExplorerQuitPost hi Pmenu ctermbg=238
            au User CocExplorerQuitPost echo

    " vim-expand-region 快速选择
        " v扩大选择 V缩小选择
            vmap     <silent>       v         <Plug>(expand_region_expand)
            vmap     <silent>       V         <Plug>(expand_region_shrink)

    " rainbow
            let g:rainbow_active = 1
            let g:rainbow_conf = {'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta', 'blue', 'yellow', 'cyan', 'magenta']}

    " vim-javascript
            let g:javascript_plugin_jsdoc = 1
            let g:javascript_plugin_ngdoc = 1
            let g:javascript_plugin_flow = 1

    " 快速跳转 vim-interestingwords
        " 设置不同匹配词颜色不同
            let g:interestingWordsRandomiseColors = 1
            nnoremap <silent>       ff        :call InterestingWords('n')<cr>
            nnoremap <silent>       FF        :call UncolorAllWords()<cr>
            nnoremap <silent>       n         :call WordNavigation('forward')<cr>
            nnoremap <silent>       N         :call WordNavigation('backward')<cr>

    " Floaterm
            let g:floaterm_title = ''
            let g:floaterm_width = 0.8
            let g:floaterm_height = 0.5
            let g:floaterm_autoclose = 1
            hi! link FloatermBorder NONE
            nnoremap <silent>       <c-t>     :try \| call system("~/scripts/edit-profile.sh VIM_TEM_DIR ".$PWD) \| endtry \| FloatermToggle TERM<cr>
            tnoremap <silent><expr> <c-t>     &ft == "floaterm" ? "<c-\><c-n>:FloatermToggle TERM<cr>" : "<c-t>"
            au BufEnter * if &buftype == 'terminal' | :call timer_start(50, { -> execute('startinsert!') }, { 'repeat': 5 }) | endif
    " fzf
        " maps
            let g:fzf_preview_window = ['right:45%', 'ctrl-/']
            let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
            let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
            com! -bar -bang Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter=: --nth=4..'}, 'right:45%', 'ctrl-/'), <bang>0)
            nnoremap <silent>       <c-a>     :Ag<cr>
            nnoremap <silent>       <c-f>     :Files<cr>
            nnoremap <silent>       <c-h>     :History<cr>
            nnoremap <silent>       <c-l>     :BLines<cr>
            nnoremap <silent>       <c-g>     :GFiles?<cr>

    " vim-dadbod
        " let g:dbs = [{ 'name': 'connection_name', 'url': 'mysql://user:password@host:port' }]
        let g:db_ui_save_location = '~/.config/zsh/cache'
        let g:db_ui_use_nerd_fonts = 1
        let g:db_ui_force_echo_notifications = 1
        let g:db_ui_table_helpers = {
        \   'mysql': {
        \     'List': 'SELECT * from `{schema}`.`{table}` order by id desc LIMIT 100;',
        \     'Indexes': 'SHOW INDEXES FROM `{schema}`.`{table}`;',
        \     'Table Fields': 'DESCRIBE `{schema}`.`{table}`;',
        \     'Alter Table': 'ALTER TABLE `{schema}`.`{table}` ADD '
        \   }
        \ }
        let g:db_ui_locked = 0
        com! CALLDB call DBUI()
        func DBUI()
            let g:db_ui_locked = 1
            set laststatus=0 showtabline=0 nonu signcolumn=no nofoldenable
            exec 'DBUI'
        endf
        func DBUIToggle()
            if floaterm#terminal#get_bufnr('DBUI') < 0
                exec 'FloatermNew --name=DBUI nvim +CALLDB'
            else
                exec 'FloatermToggle DBUI'
            endif
        endf
        nnoremap <silent><expr> <c-b> g:db_ui_locked ? "" : ":call DBUIToggle()<CR>"
        tnoremap <silent><expr> <c-b> &ft == "floaterm" ? "<c-\><c-n>:call DBUIToggle()<CR>" : "<c-b>"


    " 多游标
            let g:VM_theme                      = 'ocean'
            let g:VM_highlight_matches          = 'underline'
            let g:VM_maps                       = {}
            let g:VM_maps['Find Under']         = '<C-n>'
            let g:VM_maps['Find Subword Under'] = '<C-n>'
            let g:VM_maps['Select All']         = '<C-d>'
            let g:VM_maps['Select l']           = '<C-Right>'
            let g:VM_maps['Select h']           = '<C-Left>'
            let g:VM_maps['Add Cursor Up']      = '<C-Up>'
            let g:VM_maps['Add Cursor Down']    = '<C-Down>'
            let g:VM_maps['Add Cursor At Pos']  = '<C-x>'
            let g:VM_maps['Add Cursor At Word'] = '<C-w>'
            let g:VM_maps['Remove Region']      = 'q'
            let g:VM_maps['Increase']           = '+'
            let g:VM_maps['Decrease']           = '_'
            let g:VM_maps["Undo"]               = 'u'
            let g:VM_maps["Redo"]               = '<C-r>'

    " vim-dadbod
        " let g:dbs = [{ 'name': 'connection_name', 'url': 'mysql://user:password@host:port' }]
        let g:db_ui_save_location = '~/.config/zsh/cache'
        let g:db_ui_use_nerd_fonts = 1
        let g:db_ui_table_helpers = {
        \   'mysql': {
        \     'List': 'SELECT * from `{schema}`.`{table}` order by id desc LIMIT 100;',
        \     'Indexes': 'SHOW INDEXES FROM `{schema}`.`{table}`;',
        \     'Foreign Keys': "SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA = '{schema}' AND TABLE_NAME = '{table}' AND CONSTRAINT_TYPE = 'FOREIGN KEY';",
        \     'Primary Keys': "SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_SCHEMA = '{schema}' AND TABLE_NAME = '{table}' AND CONSTRAINT_TYPE = 'PRIMARY KEY';",
        \     'Table Fields': 'DESCRIBE `{schema}`.`{table}`;'
        \   }
        \ }

    " yaocccc
        " line
            let g:vim_line_comments = { 'vim': '"', 'vimrc': '"',
                                     \  'js': '//', 'ts': '//', 'vue': '//',
                                     \  'java': '//', 'class': '//',
                                     \  'c': '//', 'h': '//',
                                     \  'go': '//' }
            let g:line_statusline_enable = 1
            let g:line_tabline_enable = 1
            let g:line_tabline_show_pwd = 1
            let g:line_tabline_show_time = 0
            let g:line_modi_mark = '+'
            let g:line_pwd_suffix = '/'
            let g:line_unnamed_filename='~'
            let g:line_statusline_getters = ['CocErrCount', 'GitInfo']
            let g:CocErrCount = { -> printf(' E%d ', get(get(b:, 'coc_diagnostic_info', {}), 'error', 0)) }
            let g:GitInfo = { -> substitute(substitute(printf(' %s %s ', get(g:, 'coc_git_status', ''), get(b:, 'coc_git_status', '')), '\v\s{2,}', ' ', 'g'), '^\s*$', '', '') }
        " comment
            nnoremap <silent> ??           :NToggleComment<cr>
            vnoremap <silent> /       :<c-u>VToggleComment<cr>
            vnoremap <silent> ?       :<c-u>CToggleComment<cr>


" some hook
" cd ~/.config/coc/extensions/node_modules/coc-ccls
" ln -s node_modules/ws/lib lib
" sudo pacman -S the_silver_searcher fd bat
" npm i js-beautify -g
