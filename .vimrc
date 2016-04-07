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
set autochdir
set hlsearch

" show tab
set list listchars=tab:>.
" show ^M
:e ++ff=unix %

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


" ----------- vimdiff ---------------------
if &diff
    set cursorline
    set wrap
    hi CursorLine   ctermfg=Black ctermbg=206 guifg=Black guibg=206
    " hi diffLine     ctermfg=Black ctermbg=93 guifg=Black guibg=206

    " hi DiffAdd ctermfg=White ctermbg=21 guifg=White  guibg=21
    " hi diffRemoved ctermfg=Grey ctermbg=Grey guifg=Grey
    " hi DiffChange ctermfg=Black ctermbg=178 guifg=Black guibg=#FFCC22
    " hi DiffText ctermfg=Black ctermbg=222 guifg=Black guibg=#FFFF77

    nmap <F7> [c " previous diff
    nmap <F8> ]c " next diff
else
    set nocursorline
endif

"// unite
nmap uf <Esc>:Unite -start-insert file<CR>
nmap ur <Esc>:Unite file_rec<CR>
let g:unite_source_file_rec_max_depth =5

" buffergator
let g:buffergator_viewport_split_policy="T"


"----------- EasyGrep -----------
let g:EasyGrepCommand = 1
let g:EasyGrepMode = 3
let g:EasyGrepRecursive  = 1
let g:EasyGrepRoot = "cwd"
" let g:EasyGrepRoot = "search:.git,.svn
let g:EasyGrepIgnoreCase = 0
" let g:EasyGrepFilesToExclude = "tags, *.bak, *~, cscope.*, *.a, *.o, *.pyc, *.bak, *.swp"
let g:EasyGrepOpenWindowOnMatch = 1
let g:EasyGrepDefaultUserPattern = "*.c *.h *.cpp *.hpp *.cxx *.hxx *.cc *.hh *.c++ *.patch .m4 *.ac *[mM]akefile *.mk *.mak *.sh *.bash *.cmd *.bat"

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

let g:ctrlp_user_command = 'find %s -type f -name "*.h" -o -name "*.hh" -o -name "*.c" -o -name "*.cpp"'       " MacOSX/Linux

" ----------------- ctag/cscope  -------------------
if has("cscope")
    set csto=0 "// 0 = first cscope and then ctag
    set cst    "// use cscope and ctag
    set cspc=3 "// show last 3 part of path

    "// add any database
    let search_layer=4
    let curdir = getcwd()

    let i = 1
    while i < search_layer
        if filereadable("cscope.out")
            cs add cscope.out
            " let i = search_layer "// for only add one cscope database
        endif
        cd ..
        let i += 1
    endwhile

    "// search tags
    set tags=./tags;/
    set autochdir
    " set noautochdir

    " execute "cd " . curdir
endif



