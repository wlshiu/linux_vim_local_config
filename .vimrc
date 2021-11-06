

"//======================================================================
"// plugin inatall {{{1
call plug#begin('~/.vim/plugged')
"// ps. You MUST use the '' symbol

" Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
Plug 'Yggdroot/LeaderF'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'wlshiu/vim-wl'
Plug 'preservim/tagbar'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'mileszs/ack.vim'
Plug 'fidian/hexmode'
Plug 'will133/vim-dirdiff'
Plug 'vim-autoformat/vim-autoformat'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'fcamel/gj'
Plug 'Tuxdude/mark.vim'

call plug#end()
" }}}1

"//======================================================================
"// Local Congigurations
"//======================================================================

"//---------------------------
"// filetype
filetype plugin indent on
set fileformat=unix

"// show ^M
set ffs=unix

"//---------------------------
"// file encode {{{1
set t_Co=256
set encoding=utf-8
"set fileencodings=utf-8,cp950
set fileencodings=utf-8,ucs-bom,gb2312,gbk,gb18030,cp936
set fileencoding=utf-8
set termencoding=utf-8
" }}}1

"//---------------------------
"// hightlight {{{1
syntax on
" colorscheme koehler
colorscheme xoria256
" colorscheme darkblue
" }}}1

"//---------------------------
"// tab indent {{{1
set expandtab
autocmd FileType make setlocal noexpandtab

set tabstop=4
set shiftwidth=4

set cindent
" set smartindent
" set autoindent

"// show tab
set list listchars=tab:>.

"// set backspace=indent,eol
set backspace=2
" }}}1


"//---------------------------
"// status bar {{{1
set laststatus=2
set showmode
set scrolloff=3

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

" }}}1

"//--------------------------
"// incremental search {{{1
set incsearch
set hlsearch
set ignorecase
" }}}1


"//---------------------------
"// current line {{{1
"// re-set in vim if no cursor line highlight
set cursorline
set cursorcolumn
hi CursorLine cterm=none ctermbg=0 " ctermfg=White "
hi CursorColumn cterm=none ctermbg=0 " ctermfg=White "
" }}}1


"//---------------------------
"// MISC
set number
" set noswapfile

set splitbelow
set splitright

"// vim copy (press d, y, yy, ...) to clipboard of system
set clipboard=unnamed

"// Break lines at word (requires Wrap lines)
set linebreak

"// window size
" set lines=36 columns=140

"set autochdir

set foldnestmax=3
set foldcolumn=3

"// Hide buffers when they are abandoned
set hidden

"// Show (partial) command in status line
set showcmd

"// Show matching brackets.
set showmatch
" set noshowmatch

"// Automatically save before commands like :next and :make
set autowrite
set autoread

"// Enable mouse usage (all modes) in terminals
set mouse=a

set winaltkeys=no

if version >= 700
    au InsertEnter * hi StatusLine ctermbg=100 guibg=#818D29 ctermfg=254 guifg=#FCFCFC gui=none
    au InsertLeave * hi StatusLine ctermbg=251 guibg=#EEEEEE ctermfg=233 guifg=#363636 gui=none
endif

"// auto fold '{{{' to '}}}'
set foldmethod=marker


"//------------------------------------------------------------------
"// Configure syntax for unknown file type {{{1
au BufNewFile,BufRead *.rss set filetype=xml
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.lds set filetype=ld
au BufRead,BufNewFile *.expand set filetype=rtl
au BufRead,BufNewFile *.S set filetype=gas
au BufRead,BufNewFile *.s set filetype=gas
" }}}1

"//------------------------------------------------------------------
"// Configure python fold {{{1
autocmd FileType python setlocal foldmethod=indent
set foldlevel=5
nnoremap <space> za
vnoremap <space> zc

let python_highlight_all=1
" }}}1

"//======================================================================
"// hot keys
"//======================================================================

"// Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"// Delete trailing white space
nmap <Leader>de <Esc>:%s/\s\+$//g <CR>

"// Remove the Windows ^M - when the encodings gets messed up
nmap <Leader>dm <Esc>:%s/\r//g <CR>

nmap <Leader>q :ccl<CR>

"//------------------------------------------------------------------
"// vimdiff {{{1

"// move to different
map <A-Down> ]c
map <A-UP>   [c

"// save dual files
map <C-s>   :wa<CR>

"// reflash layout
" map <silent> <C-\>u :diffupdate<CR>
map <C-\>u :diffupdate<CR>

"// do fatch from the other
map <Leader>df  do

"// do push to the other
map <Leader>dp  dp

"// quit dual windows
map <A-q> :qa<CR>

"// vimdiff move to different
if &diff
    " set cursorline
    set nocursorline
    set wrap
    " set diffopt+=iwhite
    set diffopt-=iwhite

    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
else
    set nocursorline
    set diffopt-=iwhite
endif

" }}}1

"//======================================================================
"// Plug-in
"//======================================================================

" ----------- tagbar --------------------- {{{1
    let g:tagbar_left = 1
    let g:tagbar_sort = 0
    let g:tagbar_autoshowtag = 1
    let g:tagbar_autoopen = 1
    " let g:tagbar_ctags_bin='/usr/bin/ctags-exuberant'
    let g:tagbar_ctags_bin='/usr/bin/ctags'
    "// hot key
    nmap tl :TagbarToggle<CR>
" }}}1


" ----------- NERDTree ------------------- {{{1
    let NERDTreeWinPos='right'
    let NERDTreeQuitOnOpen=1
    let NERDChristmasTree=1
    let NERDTreeHighlightCursorline=1

    let g:NERDTreeDirArrows=0
    "// only show
    let NERDTreeIgnore = ['\(\.c\|\.h\|\.cpp\|\.hh\|.mk\|.py\|Makefile\|.s\|.S\|.ld\)\@<!$[[file]]']
    let NERDTreeIgnore += ['\.o$','\.a$','\.d$','\.bin$']

    nmap nt :NERDTreeToggle<CR>
    " nmap <A-n> :NERDTreeToggle<CR>
" }}}1


" --------- indetLine ------------ {{{1
    let g:indentLine_color_term = 239
    let g:indentLine_char = '¦'
" }}}1


" ----------- buffergator --------- {{{1
    let g:buffergator_viewport_split_policy="T"
" }}}1


" ----------- Ack ------------- {{{1
    let g:ackhighlight = 1

    if executable('ag')
        let g:ackprg = 'ag --nogroup --column --color-match --color-line-number --nocolor --ignore tags'
        noremap FF :Ack! <C-R>=expand("<cword>")<CR><CR>
        " noremap FF :Ack<Space>
    else
        noremap FF :echo "you need to install 'ack' or 'silversearcher-ag' first"<Enter>
    endif
" }}}1

"----------- gtags -------------- {{{1
    set cscopeprg=gtags-cscope
    let GtagsCscope_Quiet = 1
    let Gtags_No_Auto_Jump = 1

    " To use the default key/mouse mapping:
    let GtagsCscope_Auto_Map = 1
    " To ignore letter case when searching:
    let GtagsCscope_Ignore_Case = 1
    " To use absolute path name:
    let GtagsCscope_Absolute_Path = 1
    " To deterring interruption:
    let GtagsCscope_Keep_Alive = 1
    " If you hope auto loading:
    let GtagsCscope_Auto_Load = 1
    " To use 'vim -t ', ':tag' and '<C-]>'
    set cscopetag

    nmap <C-\>] :Gtags -r <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>' :Gtags -s <C-R>=expand("<cword>")<CR><CR>
" }}}1

"----------- NERD_commenter --------- {{{1
    map <C-q> <Leader>c<space>

    "// Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1

    "// Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1

    "// Align line-wise comment delimiters flush left instead of following code indentation
    let g:NERDDefaultAlign = 'left'

    "// Allow commenting and inverting empty lines (useful when commenting a region)
    let g:NERDCommentEmptyLines = 1

    "// Enable trimming of trailing whitespace when uncommenting
    let g:NERDTrimTrailingWhitespace = 1

    "// Enable NERDCommenterToggle to check all selected lines is commented or not
    let g:NERDToggleCheckAllLines = 1
" }}}1


"----------- Hexmode  -------------- {{{1
    let g:hexmode_xxd_options = '-g 1'
    let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o'
" }}}1


"----------- DirDiff  -------------- {{{1
    let g:DirDiffEnableMappings = 0
    let g:DirDiffIgnore = ".git,.svn,out,Project"
    let g:DirDiffExcludes = 'CVS,.git,.svn,out,*.class,*.exe,*.swp,*.o,*.d,tags,ID,GRTAGS,GTAGS,GPATH'
" }}}1

"----------- autoformat  ------------ {{{1
    let g:formatdef_my_cpp = '"astyle -A1 -xv -s -k -xw -w -y -m40 -p -xg -k3 -w3 --convert-tabs -xl -n --lineend=linux"'
    let g:formatters_cpp = ['c']
" }}}1

" ----------- gj -------------- {{{1
    "// It MUST execute 'gj -i' with idutils at target directory
    "// <Leader>gj to searching
" }}}1

" ----------- buffergator ------ {{{1
    let g:buffergator_viewport_split_policy="T"
" }}}1


" ----------- gutentags ------ {{{1
"// gutentags search the working directory, if no exist, ignore all files
    let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

    "// the database file name
    let g:gutentags_ctags_tagfile = '.tags'

    "// put all database (tags) to 'gutentags_cache_dir'
    let s:vim_tags = expand('~/.cache/tags')
    let g:gutentags_cache_dir = s:vim_tags
    "// mkdir ~/.cache/tags if it does not exist
    if !isdirectory(s:vim_tags)
        silent! call mkdir(s:vim_tags, 'p')
    endif

    "// the options of ctags
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" }}}1

" ----------- LeaderF ------ {{{1
"// search word under cursor, the pattern is treated as regex, and enter normal mode directly
	noremap <C-F> :<C-U><C-R>=printf("Leaderf rg -e %s ", expand("<cword>"))<CR>

	noremap <C-R> :LeaderfMruCwd<CR>
	noremap <leader>ff :LeaderfFunction<CR>

	let g:Lf_GtagsAutoGenerate = 1
	let g:Lf_RootMarkers = ['.gtags']
	let g:Lf_Gtagslabel = 'native-pygments'

	noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
	noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
	noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
	noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
	noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

	highlight Lf_hl_rgHighlight guifg=#000000 guibg=#CCCC66 ctermfg=green ctermbg=185
	highlight Lf_hl_match gui=bold guifg=Blue cterm=bold ctermfg=green
	highlight Lf_hl_match0 gui=bold guifg=Blue cterm=bold ctermfg=green
	highlight Lf_hl_match1 gui=bold guifg=Blue cterm=bold ctermfg=green
	highlight Lf_hl_match2 gui=bold guifg=Blue cterm=bold ctermfg=green
	highlight Lf_hl_match3 gui=bold guifg=Blue cterm=bold ctermfg=green
	highlight Lf_hl_match4 gui=bold guifg=Blue cterm=bold ctermfg=green
	highlight Lf_hl_matchRefine  gui=bold guifg=Magenta cterm=bold ctermfg=green
" }}}1


"======================================================================
" My functions
"======================================================================
"-----------------
" Do_CsTag(), Cscope/Ctags: {{{1
    "let cscope='$VIMRUNTIME\cscope.exe'
    function Do_CsTag()
        let cur_dir = getcwd()

        if has("cscope")
            silent! execute "cs kill -1"
        endif

        if !filereadable("cscope.files")
            if (has('win32') || has('win64'))
                silent! execute "!dir /s/b *.c,*.cpp,*.h,*.hh,*.s,*.py > cscope.files"
            else
                silent! execute "!find . -name '*.h' -o -name '*.hh' -o -name '*.c' -o -name '*.cpp' -o -iname '*.s' -o -name '*.java' -o -name '*.py' > cscope.files"
            endif
        endif

        if (executable('ctags'))
            silent! execute "!ctags --c++-kinds=+p --fields=+iaS --extras=+q --sort=yes -L cscope.files"
        endif

        if (executable('cscope') && has("cscope") )
            silent! execute "!cscope -bkq -i cscope.files"
            execute "normal :"
            if filereadable("cscope.out")
                execute "cs add cscope.out"
            endif
        else
            execute "normal :"
        endif

        "CCTreeLoadDB
    endfunction

    "// do ctag and cscope, finally load cscope.out to CCTree
    map <A-g> <Esc>:call Do_CsTag() <CR>
    nmap tg <Esc>:call Do_CsTag() <CR>


" }}}1

"-----------------
" Do_GTag(), gtags: {{{1
    " let gtags='$VIMRUNTIME\gtags.exe'
    function Do_GTag()
        let cur_dir = getcwd()

        " if (executable('ctags'))
        "     silent! execute "!ctags --c++-kinds=+p --fields=+iaS --extras=+q --sort=yes -L cscope.files"
        " endif

        if (executable('gtags'))
            silent! execute "!gtags -s -f ./cscope.files"
            execute "normal :"
            if filereadable("GTAGS")
                execute "cs add GTAGS"
            endif
        endif
    endfunction

" }}}1

"-----------------
" RemoveTrailingWhitespace(), remove trailing white space {{{1
function RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()
" }}}1

"-----------------
" AddTitle(), add file Copyright  {{{1
function! AddTitle()
    call append(0,"")
    call append(1,"Copyright (c) 2021 Wei-Lun Hsu. All Rights Reserved.")
    call append(2,"")
    call append(3,"@file ".expand("%:t"))
    call append(4,"@author Wei-Lun Hsu")
    call append(5,"@date Last Modified ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(6,"")
endfunction
" }}}1


