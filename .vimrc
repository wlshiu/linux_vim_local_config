"========================================================
" Firet
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/
"========================================================



set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'Tuxdude/mark.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'Yggdroot/indentLine'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



"============================================
set t_Co=256
set encoding=utf-8
set fileencodings=utf-8,cp950
set fileencoding=utf-8
set termencoding=utf-8

syntax on
filetype plugin on

" colorscheme koehler
colorscheme xoria256
" colorscheme darkblue
set number
set expandtab
autocmd FileType make setlocal noexpandtab

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
set hlsearch

" show tab
set list listchars=tab:>.
" show ^M
set ffs=unix

set statusline=%F%m%r%h%w\ [%{&ff}]%y[%p%%][%04l/%L,%04v]
"              | | | | |    |      |  |     |    |  |
"              | | | | |    |      |  |     |    |  + current column
"              | | | | |    |      |  |     |    +-- number of lines
"              | | | | |    |      |  |     +-- current line
"              | | | | |    |      |  |
"              | | | | |    |      |  +-- current % into file
"              | | | | |    |      +-- current syntax in square brackets
"              | | | | |    |
"              | | | | |    +-- current fileformat
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer

if version >= 700
    au InsertEnter * hi StatusLine ctermbg=100 guibg=#818D29 ctermfg=254 guifg=#FCFCFC gui=none
    au InsertLeave * hi StatusLine ctermbg=251 guibg=#EEEEEE ctermfg=233 guifg=#363636 gui=none
endif

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"// set height light word
" nmap <leader>m: syn match TempKeyword /\<<C-R>=expand("<cword>")<CR>\>/<CR>
" nmap <leader>c: syn clear TempKeyword<CR>
"nmap <leader>m :call matchadd("TempKeyword", "<C-R>=expand("<cword>")<CR>")<CR>
"nmap <leader>c :call clearmatches()<CR>
hi TempKeyword    ctermfg=0 ctermbg=149

"// Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"// jump to line start/end
nmap ms <Home>
nmap mt <End>
"// Delete trailing white space
nmap \de <Esc>:%s/\s\+$//g <CR>
"
"// Remove the Windows ^M - when the encodings gets messed up
nmap \dm <Esc>:%s/\r//g <CR>

if filereadable("cscope.out")
    execute "cs add cscope.out"
endif


" ----- set python fold ----------------
autocmd FileType python setlocal foldmethod=indent
set foldlevel=5
nnoremap <space> za
vnoremap <space> zc

let python_highlight_all=1

" ----------- tagbar ---------------------
let g:tagbar_left = 1
let g:tagbar_sort = 0
let g:tagbar_autoshowtag = 1
let g:tagbar_autoopen = 1
"// hot key
nmap tl :TagbarToggle<CR>

" ----------- NERDTree ---------------------
let NERDTreeWinPos='right'
let NERDTreeQuitOnOpen=1
let NERDChristmasTree=1
let NERDTreeHighlightCursorline=1

let g:NERDTreeDirArrows=0
"// only show
let NERDTreeIgnore = ['\(\.c\|\.h\|\.cpp\|\.hh\)\@<!$[[file]]']
let NERDTreeIgnore += ['\.o$','\.a$']

nmap nt :NERDTreeToggle<CR>
" nmap <A-n> :NERDTreeToggle<CR>

" ----------- CtrlP ---------------------
" let g:ctrlp_map = '<A-w>'
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](\.git|\.hg|\.svn|IAR|Debug|Release)$',
  \ 'file': '\v\.(exe|so|dll|o|a|out|obj|bin|cmd)$',
  \ }

let g:ctrlp_match_window = 'results:200'
let g:ctrlp_user_command = 'find %s -type f -name "*.h" -o -name "*.hh" -o -name "*.c" -o -name "*.cpp"'       " MacOSX/Linux

" --------- indetLine ------------
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'

" ----------- buffergator ----------
let g:buffergator_viewport_split_policy="T"

