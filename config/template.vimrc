autocmd BufNewFile *.vue,*.js,*.ts,*.sh,*.css call SetTitle()
autocmd BufWritePre *.vue,*.js,*.ts,*.sh,*.css call SetLastModified()

let s:getCreatedTimeStr =  {->printf(' * @createdTime    %s', strftime("%a, %b %d, %Y %R"))}
let s:getModifiedTimeStr = {->printf(' * @lastModified   %s', strftime("%a, %b %d, %Y %R"))}

func s:getTemplete(type)
    let templates = {
        \'vue': [
        \    "<template>",
        \    "  <div :class=\"\classes\"\>",
        \    "    ",
        \    "  </div>",
        \    "</template>",
        \    "<script>",
        \    "const prefixCls = 'vi-".expand("%:t:r") . "'",
        \    "export default {",
        \    "  name: 'Vi".expand("%:t:r") . "'," ,
        \    "  data() {",
        \    "    return {}",
        \    "  },",
        \    "  props: {},",
        \    "  methods: {},",
        \    "  watch: {},",
        \    "  created() {},",
        \    "  mounted() {},",
        \    "  computed: {",
        \    "    classes() {",
        \    "      return [",
        \    "        `${ prefixCls }`",
        \    "       ]",
        \    "     }",
        \    "  },",
        \    "  components: {}",
        \    "}",
        \    "</script>",
        \    "<style lang=\"\scss\"\ rel=\"\stylesheet/scss\"\>",
        \    "$-prefix-cls: 'vi-".expand("%:t:r") . "';",
        \    ".#{$-prefix-cls} {",
        \    "}",
        \    "</style>",
        \    "<!-- vim: set ft=vue ff=unix et sw=2 ts=2 sts=2 tw=150: -->",
        \],
        \'javascript': [
        \    "/**",
        \    " * @fileName       ".expand("%:t:r"),
        \    s:getCreatedTimeStr(),
        \    s:getModifiedTimeStr(),
        \    " * @author         QuanQuan <millionfor@apache.org>",
        \    " * @description    x",
        \    " */",
        \],
        \'typescript': [
        \    "/**",
        \    " * @fileName       ".expand("%:t:r"),
        \    s:getCreatedTimeStr(),
        \    s:getModifiedTimeStr(),
        \    " * @author         QuanQuan <millionfor@apache.org>",
        \    " * @description    x",
        \    " */",
        \],
        \'default': [
        \    "/**",
        \    " * @fileName       ".expand("%:t:r"),
        \    s:getCreatedTimeStr(),
        \    s:getModifiedTimeStr(),
        \    " * @author         QuanQuan <millionfor@apache.org>",
        \    " * @description    x",
        \    " */",
        \],
        \}
    return get(templates, a:type, templates['default'])
endf

func SetTitle()
    let template = s:getTemplete(&filetype)
    call append(0, template)
    exec 'normal G'
endf

func SetLastModified()
    for n in range(10)
        if getline(n) =~ '^\s*\*\s*@lastModified\s*\S*.*$'
            call setline(n, s:getModifiedTimeStr())
            return
        endif
    endfor
endf

