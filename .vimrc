" #############################################################################
" #
" #                                 键位映射
" #
" #############################################################################

" Remap leader key
"let mapleader = ","
let mapleader = "\<Space>"

" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :

" Press jj to exit from insert mode.
inoremap jj <Esc>
" Can be typed even faster than jj.
inoremap jk <Esc>
inoremap kj <Esc>
inoremap jw <Esc>
inoremap wj <Esc>
" Press i to enter insert mode, and ii to exit.
imap ii <Esc>
" Two semicolons are easy to type.
imap ;; <Esc>
nmap ;; <Esc>
vmap ;; <Esc>
  
" You can press Tab to return to normal mode.
nnoremap <Tab> <Esc>
" The vnoremap causes Tab to cancel any selection (gV is required to prevent automatic reselection).
vnoremap <Tab> <Esc>gV
" The onoremap causes Tab to cancel any operator-pending command (for example, y).
onoremap <Tab> <Esc>

" The first inoremap causes Tab to exit insert mode, and the `^ restores the cursor position so exiting insert does not move the cursor left.
"inoremap <Tab> <Esc>`^
" The second inoremap, assuming the default leader key, allows you to press \ then Tab to insert a tab character.
inoremap <Leader><Tab> <Tab>

" 空格键向上滚屏光标不变
"nnoremap <Space> 2<C-e>
"noremap <C-j> 3<C-e>
"noremap <C-k> 3<C-y>

" Ctrl+h l 分别在插入模式下左右移动
imap <C-h> <Esc>i
imap <C-l> <Esc>la

" 不保存退出
noremap qq <Esc>:q!<CR>
" 保存退出
noremap tsq <Esc>:wq<CR>
" 保存文件
imap vv <Esc>:w<CR>
map vv <Esc>:w<CR>
nmap <leader>w :w!<cr>

" Backspace 键映射为 Z 键
nnoremap z i<BS><Esc>l

" 分屏窗口移动, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Go to home and end using capitalized directions
noremap H ^
noremap L $

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>
cnoremap <C-P>      <Up>
cnoremap <C-N>      <Down>

" 切换前后buffer
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
" 使用方向键切换buffer
noremap <left> :bp<CR>
noremap <right> :bn<CR>

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" 去掉搜索高亮
"noremap <silent><leader>/ :nohls<CR>
noremap <silent><leader><cr> :nohls<CR>

" y$ -> Y Make Y behave like other capitals
map Y y$

" 复制选中区到系统剪切板中
vnoremap <leader>y "+y

" select all
map <Leader>sa ggVG"

" select block
nnoremap <leader>v V`}

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" change word to uppercase, I love this very much
inoremap <C-u> <esc>gUiwea

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Surround the visual selection in parenthesis/brackets/etc
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Quickly insert parenthesis/brackets/etc
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i

" F2 开启/关闭行号显示:
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>

" F3 显示可打印字符开关
nnoremap <F3> :set list! list?<CR>

" F4 换行开关
nnoremap <F4> :set wrap! wrap?<CR>

" F5 插入/粘贴模式
set pastetoggle=<F5>            "    when in insert mode, press <F5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

" Press F7 The tabs will be converted to 4 spaces and file will be saved automatically.
nnoremap <F7> :retab <CR> :w <CR>


" #############################################################################
" #
" #                                 设置
" #
" #############################################################################

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" 启动的时候不显示那个援助索马里儿童的提示
"set shortmess=atI

" 设置退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=

" 鼠标暂不启用, 键盘党....
set mouse-=a

" 高亮第80列
set colorcolumn=80

" 设置编码格式
set encoding=utf-8
set termencoding=utf-8
set fencs=ucs-bom,utf8,gb18030,gbk,gb2312,big5,euc-jp,euc-kr,latin1,cp936
set fileencodings=utf8,cp936,gb18030,big5

" Show number
set number

" 搜索不区分大小写，但键入了大写则自动区分大小写
set ignorecase
set smartcase

" 状态栏格式定义
set laststatus=2

" 设置缩进和展开
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=79
set fileformat=unix

" 语法高亮
syntax on
"syntax off

filetype plugin indent on

" 不备份
set nobackup

" 不产生swap文件
set noswapfile

" 搜索高亮
set hlsearch

" 显示不可见字符。
" 在显示不可见字符的情况下，TAB 键显示为 ^I，而 $ 显示在每行的结尾。
set list

" 设置换行
set wrap

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber

" 插入模式下用绝对行号, 普通模式下用相对行号
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<CR>

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g'\"" | endif
endif

" 设置可以高亮的关键字
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif

" Basic Settings

set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set noundofile
nnoremap / /\v
vnoremap / /\v
vnoremap . :norm.<CR>
set gdefault
set incsearch
set showmatch
"nnoremap <tab> %
"vnoremap <tab> %
set linebreak
set formatoptions=qrn1
"set spell spelllang=en_us

" Arrows are unvimlike 

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Toggle spelling visuals with <leader>s
nnoremap <leader>s :set spell!<cr>



" #############################################################################
" #
" #                             模板相关设置
" #
" #############################################################################

" 保存 Python 文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Python文件中输入新行时#号注释不切回行首
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#

" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python3")
        call append(1, "\# -*- coding: utf-8 -*-")
    endif

    normal G
    normal o
    normal o
endfunc
