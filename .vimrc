" vimrc by xue 5.19/2010 CTU

if exists("xue")
	finish
endif

" 行号
set number

" 状态行
set stl=\ [file]\ %F%m%r%h%y[%{&fileencoding}]
set ls=1

" tab 和 缩进
set tabstop=4
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

" 自动切换到文件当前目录
set autochdir

set showcmd

" GVIM 下的配置
if has('gui_running')
    " 高亮光标所在行
    set cursorline
    " 只显示菜单和右侧滚动条
    set guioptions=c
    " 字体
    set guifont=文泉驿等宽微米黑\ 11
endif

" 界面
set term=xterm-256color
colorscheme oceandeep

" 快捷键
map tn :tabnext<cr>
map tp :tabprevious<cr>
map tc :tabclose<cr>
map <C-t> :tabnew<cr>

" 文件树
map td :NERDTree <cr>
" 缓存列表
map bf :BufExplorer<cr>
" 日历
map ca :Calendar<cr>

" 自动加载
if has("autocmd")
    filetype plugin indent on

    " 括号自动补全
    func AutoClose()
        :inoremap ( ()<ESC>i
        :inoremap " ""<ESC>i
        :inoremap ' ''<ESC>i
        :inoremap { {}<ESC>i
        :inoremap [ []<ESC>i
        :inoremap ) <c-r>=ClosePair(')')<CR>
        :inoremap } <c-r>=ClosePair('}')<CR>
        :inoremap ] <c-r>=ClosePair(']')<CR>
    endf
    func ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
            return "\<Right>"
        else
            return a:char
        endif
    endf

    au FileType php,c,python,javascript,html exe AutoClose()

    augroup vimrcEx
        au!
        autocmd FileType text setlocal textwidth=80
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif
    augroup END

endif

syntax on

" vimwiki
let mywiki={}
let mywiki.path_html="/var/www/wiki/"
let mywiki.html_header="~/vimwiki/template/header.tpl"
let mywiki.auto_export=1
let mywiki.nested_syntaxes={"c":"c","css":"css","javascript":"javascript","python":"python","html":"html"}
let g:vimwiki_list=[mywiki]








