" #############################################################################
" #
" #                                 键位映射
" #
" #############################################################################

"let mapleader = "\<Space>"
let mapleader=","       " leader is comma

" Map ; to : and save a million keystrokes
nnoremap ; :

" map escape to pressing jk at the same time (thanks touchbar)
inoremap jk <Esc>
inoremap kj <Esc>
inoremap jj <Esc>
" Press i to enter insert mode, and ii to exit.
imap ii <Esc>
" Two semicolons are easy to type.
vmap ;; <Esc>
inoremap ;; <Esc>

" edit vimrc/bashrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>eb :vsp ~/.bashrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" save session
nnoremap <leader>s :mksession<CR>

" You can press Tab to return to normal mode.
nnoremap <Tab> <Esc>
" The vnoremap causes Tab to cancel any selection (gV is required to prevent automatic reselection).
vnoremap <Tab> <Esc>gV
" The onoremap causes Tab to cancel any operator-pending command (for example, y).
onoremap <Tab> <Esc>

" ctrlp config
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0

inoremap <Tab> <C-P>

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
"nnoremap z i<BS><Esc>l

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nmap <C-e> :E<cr>

if $term == "xterm-256color" || $term == "screen-256color" || $colorterm == "gnome-terminal"
  set t_co=256
endif


" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Go to home and end using capitalized directions
noremap H ^
noremap L $

" $/^ doesn't do anything
"nnoremap $ <nop>
"nnoremap ^ <nop>

" unmap ex mode: 'Type visual to go into Normal mode.'
nnoremap Q <nop>

" highlight last inserted text
nnoremap gV `[v`]

" Bash like keys for the command line
cnoremap <C-B>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>
cnoremap <C-P>      <Up>
cnoremap <C-N>      <Down>

" 切换前后buffer
map <leader>n :bnext<cr>
map <leader>p :bprevious<cr>
" 使用方向键切换buffer
"noremap <left> :bprevious<CR>
"noremap <right> :bnext<CR>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

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
map <leader>t<leader> :tabnext<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

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

" map markdown preview
map <leader>m :!open -a "Marked 2" "%"<cr><cr>

" map git commands
map <leader>l :!clear && git log -p %<cr>
map <leader>d :!clear && git diff %<cr>

" space open/closes folds
nnoremap <space> za

" Arrows are unvimlike 

"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" disable the arrow keys
nnoremap <left> :echoe "use h"<cr>
nnoremap <right> :echoe "use l"<cr>
nnoremap <up> :echoe "use k"<cr>
nnoremap <down> :echoe "use j"<cr>

" unmap F1 help
nmap <F1> <nop>
imap <F1> <nop>

" F2 开启/关闭行号显示:
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

" 按F8运行Python$
map <F8> :w<cr>:!python3 %<cr>

" F12 open NERDTree
nmap <F12> :NERDTree  <cr>

" autocmd vimenter * nerdtree 
let nerdtreeshowbookmarks=1
let nerdtreechdirmode=2


" #############################################################################
" #
" #                                 设置
" #
" #############################################################################

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
set foldlevel=99
" Add a bit extra margin to the left
set foldcolumn=1

" 启动的时候不显示那个援助索马里儿童的提示
"set shortmess=atI

" 设置退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=

set cursorline          " highlight current line

" 高亮第80列
set colorcolumn=80

" 设置编码格式
set encoding=utf-8
set termencoding=utf-8
set fencs=ucs-bom,utf8,gb18030,gbk,gb2312,big5,euc-jp,euc-kr,latin1,cp936
set fileencodings=utf8,cp936,gb18030,big5

set number              " show line numbers

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Always show the status line
set laststatus=2

" 设置缩进和展开
set autoindent      "Auto indent
set smartindent     "Smart indent
set textwidth=79
set fileformat=unix
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
" Be smart when using tabs ;)
set smarttab
" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" enable all Python syntax highlighting features
let python_highlight_all = 1

" 语法高亮
syntax on           " enable syntax processing

filetype plugin indent on      " load filetype-specific indent files

" set title to show in console title bar
set title

" do not keep a backup file!
set nobackup

" 不产生swap文件
set noswapfile

" 在显示不可见字符的情况下，TAB 键显示为 ^I，而 $ 显示在每行的结尾。
set list

set wrap            "Wrap lines

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber

" 插入模式下用绝对行号, 普通模式下用相对行号
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber

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

set showcmd             " show command in bottom bar
set wildmenu            " visual autocomplete for command menu
set wildmode=list:longest,full
set lazyredraw          " redraw only when we need to.
nnoremap / /\v
vnoremap / /\v
vnoremap . :norm.<CR>   " map . in visual mode
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set showmatch           " highlight matching [{()}]
set ruler               " Text after a double-quote is a comment
"set cmdheight=2         " Height of the command bar
" Set to auto read when a file is changed from the outside
set autoread
" Don't redraw while executing macros (good performance config)
set lazyredraw 
" For regular expressions turn magic on
set magic
" No annoying sound on errors
set noerrorbells
set novisualbell

"set background=dark

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

set nocompatible                  " don't need to be compatible with old vim

set clipboard=unnamed             " use the system clipboard

" open new split panes to right and bottom
set splitbelow
set splitright


" #############################################################################
" #
" #                                 Custom Functions
" #
" #############################################################################

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" Autogroups
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" 定义函数AutoSetFileHead，自动插入文件头
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
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"

" toggle between number and relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<CR>

" 开启/关闭行号显示:
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

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Python文件中输入新行时#号注释不切回行首
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" To add the proper PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

autocmd BufNewFile,BufReadPost *.md set filetype=markdown


" #############################################################################
" #
" #                                 Plugin
" #
" #############################################################################


