" if (&term == "xterm")
	let &t_Co=256
	let &t_AF="\e[38;5;%dm"
	let &t_AB="\e[48;5;%dm"
" endif

"/***************************************************************
"* Function
"***************************************************************/
" set diffexpr=MyDiff()
" function MyDiff()
"     let opt = '-a --binary '
"     if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"     if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"     let arg1 = v:fname_in
"     if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"     let arg2 = v:fname_new
"     if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"     let arg3 = v:fname_out
"     if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"     if $VIMRUNTIME =~ ' '
"         if &sh =~ '\<cmd'
"             if empty(&shellxquote)
"                 let l:shxq_sav = ''
"                 set shellxquote&
"             endif
"             let cmd = '"' . $VIMRUNTIME . '\diff"'
"         else
"             let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"         endif
"     else
"       let cmd = $VIMRUNTIME . '\diff'
"     endif
"     silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
"     if exists('l:shxq_sav')
"         let &shellxquote=l:shxq_sav
"     endif
" endfunction

" set encoding=utf-8
" set fileencodings=utf-8,cp950
" set fileencoding=utf-8
" set termencoding=utf-8
" source $VIMRUNTIME/delmenu.vim
" source $VIMRUNTIME/menu.vim
" language messages zh_tw.utf-8

set lines=42 columns=140

syntax on

" colorscheme koehler
colorscheme xoria256
" colorscheme darkblue
set number
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set laststatus=2
set showmode
set scrolloff=3
set showmatch
set foldnestmax=3
set foldcolumn=3
set fileformat=unix
set autoread
set ignorecase
"set autochdir

set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer

if version >= 700
    au InsertEnter * hi StatusLine ctermbg=100 guibg=#818D29 ctermfg=254 guifg=#FCFCFC gui=none
    au InsertLeave * hi StatusLine ctermbg=251 guibg=#EEEEEE ctermfg=233 guifg=#363636 gui=none
endif

"// Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"// jump to line start/end
nmap ms <Home>
nmap mt <End>

" ----------- tagbar ---------------------
let g:tagbar_left = 1
let g:tagbar_sort = 0
let g:tagbar_autoshowtag = 1
let g:tagbar_autoopen = 1
"// hot key
nmap tl :TagbarToggle<CR>

" ----------- tagbar ---------------------
let NERDTreeWinPos='right'
let NERDTreeQuitOnOpen=1
let NERDChristmasTree=1
let NERDTreeHighlightCursorline=1
nmap nt :NERDTreeToggle<CR>
" nmap <A-n> :NERDTreeToggle<CR>


" 按 F8 可以切換是否高亮度顯示搜尋字串
map <F8> :set hls!<BAR>set hls?<CR>

if &diff
    set cursorline
    set wrap
    hi CursorLine   ctermfg=Black ctermbg=206 guifg=Black guibg=206
    hi diffLine     ctermfg=Black ctermbg=93 guifg=Black guibg=206

    " 設定各種差異時，標示的顏色
    " Add 代表新增的一行， Delete 代表刪除的一行，
    " Change 代表有差異的一行，Text 代表有差異的這一行中，具有差異的部份
    hi DiffAdd ctermfg=White ctermbg=21 guifg=White  guibg=21
    " hi DiffDelete ctermfg=Grey ctermbg=DarkRed guifg=Grey
    hi diffRemoved ctermfg=Grey ctermbg=Grey guifg=Grey
    hi DiffChange ctermfg=Black ctermbg=178 guifg=Black guibg=#FFCC22
    hi DiffText ctermfg=Black ctermbg=222 guifg=Black guibg=#FFFF77

    map <A-Down> ]c
    map <A-UP>   [c
else
    set !cursorline
endif


