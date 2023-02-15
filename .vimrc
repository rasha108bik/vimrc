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
set rtp+=~/.vim/bundle/Vundle.vim
set clipboard=unnamed
set encoding=UTF-8

" PLUGINS ---------------------------------------------------------------- {{{

call vundle#begin()

	" Pretty font icons like Seti-UI {{{
		" Needs to be near the end because it changes the way some of the
		" other plugins like ctrl-p, startify, NERDTree, etc. work.
        
        " Create a dictionary of the colors for later use
		let g:sol = {
			\"gui": {
				\"base03": "#002b36",
				\"base02": "#073642",
				\"base01": "#586e75",
				\"base00": "#657b83",
				\"base0": "#839496",
				\"base1": "#93a1a1",
				\"base2": "#eee8d5",
				\"base3": "#fdf6e3",
				\"yellow": "#b58900",
				\"orange": "#cb4b16",
				\"red": "#dc322f",
				\"magenta": "#d33682",
				\"violet": "#6c71c4",
				\"blue": "#268bd2",
				\"cyan": "#2aa198",
				\"green": "#719e07"
			\},
			\"cterm": {
				\"base03": 8,
				\"base02": 0,
				\"base01": 10,
				\"base00": 11,
				\"base0": 12,
				\"base1": 14,
				\"base2": 7,
				\"base3": 15,
				\"yellow": 3,
				\"orange": 9,
				\"red": 1,
				\"magenta": 5,
				\"violet": 13,
				\"blue": 4,
				\"cyan": 6,
				\"green": 2
			\}
		\}

		Plugin 'ryanoasis/vim-devicons'
		let g:WebDevIconsUnicodeDecorateFolderNodes = 1
		let g:DevIconsEnableFoldersOpenClose = 1
		if exists("g:loaded_webdevicons")
			call webdevicons#refresh()
		endif
		augroup devicons
			autocmd!
			autocmd FileType nerdtree setlocal nolist
			autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=ALL
			autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=ALL
			autocmd FileType nerdtree setlocal conceallevel=3
			autocmd FileType nerdtree setlocal concealcursor=nvic
		augroup END
		function! DeviconsColors(config)
			let colors = keys(a:config)
			augroup devicons_colors
				autocmd!
				for color in colors
					if color == 'normal'
						exec 'autocmd FileType nerdtree,startify if &background == ''dark'' | '.
							\ 'highlight devicons_'.color.' guifg='.g:sol.gui.base01.' ctermfg='.g:sol.cterm.base01.' | '.
							\ 'else | '.
							\ 'highlight devicons_'.color.' guifg='.g:sol.gui.base1.' ctermfg='.g:sol.cterm.base1.' | '.
							\ 'endif'
					elseif color == 'emphasize'
						exec 'autocmd FileType nerdtree,startify if &background == ''dark'' | '.
							\ 'highlight devicons_'.color.' guifg='.g:sol.gui.base1.' ctermfg='.g:sol.cterm.base1.' | '.
							\ 'else | '.
							\ 'highlight devicons_'.color.' guifg='.g:sol.gui.base01.' ctermfg='.g:sol.cterm.base01.' | '.
							\ 'endif'
					else
						exec 'autocmd FileType nerdtree,startify highlight devicons_'.color.' guifg='.g:sol.gui[color].' ctermfg='.g:sol.cterm[color]
					endif
					exec 'autocmd FileType nerdtree,startify syntax match devicons_'.color.' /\v'.join(a:config[color], '|').'/ containedin=ALL'
				endfor
			augroup END
		endfunction
		let g:devicons_colors = {
			\'normal': ['', '', '', '', ''],
			\'emphasize': ['', '', '', '', '', '', '', '', '', '', ''],
			\'yellow': ['', '', ''],
			\'orange': ['', '', '', 'λ', '', ''],
			\'red': ['', '', '', '', '', '', '', '', ''],
			\'magenta': [''],
			\'violet': ['', '', '', ''],
			\'blue': ['', '', '', '', '', '', '', '', '', '', '', '', ''],
			\'cyan': ['', '', '', ''],
			\'green': ['', '', '', '']
		\}
		call DeviconsColors(g:devicons_colors)
        " }}}}

Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'

Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

Plugin 'Shougo/ddc.vim'
Plugin 'shun/ddc-vim-lsp'

Plugin 'preservim/nerdtree'

Plugin 'fatih/molokai'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
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
"
map qq :q!<CR>

" NERDTree options
map <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1


" fatih/go-vim
map gc :GoCallers<CR>
map gr :GoReferrers<CR>
map gs :GoRun<CR>
map <S-F6> :GoRename<CR>

"map <c-o> vertical resize +2
"map <c-p> vertical resize -2

map <space>- :bprevious<CR>
map <space>= :bnext<CR>
nnoremap <leader>q :bp<cr>:bd #<cr>


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


set guifont=hack_nerd_font:h24
