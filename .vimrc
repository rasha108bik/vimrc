"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype on
filetype plugin on
filetype indent on
syntax on
set nocompatible
set number
set cursorline
""set cursorcolumn
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set scrolloff=10
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set wildmenu
set list
set listchars=trail:·,tab:⇥\ ,nbsp:⍽,extends:▸,precedes:◂
set encoding=utf-8
set rtp+=~/.vim/bundle/Vundle.vim
set clipboard=unnamed

" PLUGINS ---------------------------------------------------------------- {{{

call vundle#begin()

Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'

Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

Plugin 'Shougo/ddc.vim'
Plugin 'shun/ddc-vim-lsp'

Plugin 'preservim/nerdtree'

Plugin 'fatih/molokai'

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" install plugin golang
Plugin 'fatih/vim-go'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

map <F2> :NERDTreeToggle<CR>

" fatih/go-vim
map gc :GoCallers<CR>
map gr :GoReferrers<CR>
map gs :GoRun<CR>
map <S-F6> :GoRename<CR>

"map <c-o> vertical resize +2
"map <c-p> vertical resize -2

map <space>- :bprevious<CR>
map <space>= :bnext<CR>

" back to previous file
map<c-q> :e#<CR>

nnoremap<space>h <C-w>h
nnoremap<space>j <C-w>j
nnoremap<space>l <C-w>l
nnoremap<space>k <C-w>k

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" Enable the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" You can split a window into sections by typing :split or :vsplit.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline nocursorcolumn
augroup END

" If GUI version of Vim is running set these options.
"if has('gui_running')

    " Set the background tone.
    set background=dark

    " Set the color scheme.
    colorscheme default

    " Set a custom font you have installed on your computer.
    " Syntax: <font_name>\ <weight>\ <size>
    set guifont=Monospace\ Regular\ 12

    " Display more of the file by default.
    " Hide the toolbar.
    set guioptions-=T

    " Hide the the left-side scroll bar.
    set guioptions-=L

    " Hide the the left-side scroll bar.
    set guioptions-=r

    " Hide the the menu bar.
    set guioptions-=m

    " Hide the the bottom scroll bar.
    set guioptions-=b

    " Map the F4 key to toggle the menu, toolbar, and scroll bar.
    " <Bar> is the pipe character.
    " <CR> is the enter key.
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>

"endif

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" }}}

" Go syntax highlighting -------------------------------------------------------------- {{{
" vim-go
let g:go_highlight_variable_declarations = 1
let g:go_highlight_function_calls = 1
let g:go_auto_type_info = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Use new vim 8.2 popup windows for Go Doc
let g:go_doc_popup_window = 1

" asyncomplete.vim
let g:asyncomplete_auto_popup = 1

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" vim-lsp
let g:lsp_diagnostics_echo_cursor = 1
" }}}
