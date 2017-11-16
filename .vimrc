"========================================================
" Firet
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/
"========================================================



" set nocompatible              " be iMproved, required
" filetype off                  " required
"
" " set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/
" call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'kien/ctrlp.vim'
" Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/nerdcommenter'
" Plugin 'majutsushi/tagbar'
" Plugin 'Tuxdude/mark.vim'
" Plugin 'jeetsukumaran/vim-buffergator'
" Plugin 'Yggdroot/indentLine'
"
" " All of your Plugins must be added before the following line
" call vundle#end()            " required
" filetype plugin indent on    " required

"============================================
set t_Co=256
set encoding=utf-8
set fileencodings=utf-8,cp950
set fileencoding=utf-8
set termencoding=utf-8
" set lines=36 columns=140

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
set cursorline
set winaltkeys=no

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

"let &t_ti.="\e[1 q"
"let &t_SI.="\e[5 q"
"let &t_EI.="\e[1 q"
"let &t_te.="\e[0 q"

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

nmap \q :ccl<CR>

if filereadable("cscope.out")
    execute "cs add cscope.out"
endif


"// vimdiff move to different
if &diff
    set cursorline
    set wrap

    map <A-Down> ]c
    map <A-UP>   [c
else
    set nocursorline
endif

" ----- set syntax for unknown file type ----------------
au BufNewFile,BufRead *.rss set filetype=xml
au! BufRead,BufNewFile *.md       set filetype=markdown

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

let g:ctrlp_buffer_func = { 'enter': 'BrightHighlightOn', 'exit':  'BrightHighlightOff', }

function BrightHighlightOn()
    hi CursorLine ctermbg=239
endfunction

function BrightHighlightOff()
    hi CursorLine ctermbg=none
endfunction

" --------- indetLine ------------
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'

" ----------- buffergator ----------
let g:buffergator_viewport_split_policy="T"

" ----------- bash-support ----------
let g:BASH_MapLeader = ','

" ----------- Ack ----------
let g:ackhighlight = 1

"----------- gtags --------------
set cscopetag
set cscopeprg=gtags-cscope
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Quiet = 1
let Gtags_No_Auto_Jump = 1

nmap <C-\>] :Gtags -r <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>' :Gtags -s <C-R>=expand("<cword>")<CR><CR>

"============================================
    "-----------------
    " Cscope/Ctags: {{{1
        "let cscope='$VIMRUNTIME\cscope.exe'
        function Do_CsTag()
            let cur_dir = getcwd()

            "if has("cscope")
            "    silent! execute "cs kill -1"
            "endif

            if filereadable("cscope.out")
                if (has('win32') || has('win64'))
                    let csoutdeleted=delete(cur_dir."\\"."cscope.out")
                else
                    let csoutdeleted=delete("./"."cscope.out")
                endif

                if (csoutdeleted!=0)
                    echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
                    return
                endif
            endif

            " if filereadable("cscope.files")
            "     if (has('win32') || has('win64'))
            "         let csfilesdeleted=delete(cur_dir."\\"."cscope.files")
            "     else
            "         let csfilesdeleted=delete("./"."cscope.files")
            "     endif
            "     if(csfilesdeleted!=0)
            "         echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            "         return
            "     endif
            " endif

            " if !filereadable("cscope.files")
            "     "if (has('win32') || has('win64'))
            "     "    silent! execute "!dir /s/b *.c,*.cpp,*.h,*.hh,*.py > cscope.files"
            "     "else
            "         silent! execute "!find . -type f -name '*.h' -o -name '*.hh' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.py' > cscope.files"
            "     "endif
            " endif

            if (executable('ctags'))
                " silent! execute "!ctags -R --c-types=+p --fields=+S *"
                " silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
                silent! execute "!ctags --c++-kinds=+p --fields=+iaS --extra=+q --sort=yes -L cscope.files"
            endif

            if (executable('gtags'))
                "if !filereadable("GTAGS")
                    "silent! execute "global -u"
                    silent! execute "!gtags -f ./cscope.files"
                "endif
                execute "normal :"
                if filereadable("GTAGS")
                    execute "cs add GTAGS"
                endif
            endif

            "if (executable('cscope') && has("cscope") )
            "    silent! execute "!cscope -bkq -i cscope.files"
            "    execute "normal :"
            "    if filereadable("cscope.out")
            "        execute "cs add cscope.out"
            "    endif
            "endif

            "CCTreeLoadDB
        endfunction

        " do ctag and cscope, finally load cscope.out to CCTree
        map <A-g> <Esc>:call Do_CsTag() <CR>
        nmap tg <Esc>:call Do_CsTag() <CR>


    " }}}1

