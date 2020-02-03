" Set leader key for future commands
let mapleader = ","

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif


" Install plugins
call plug#begin('~/.config/nvim/plugged')

	" anything that surrounds: parens, brackets, quotes, tags, etc.
	Plug 'tpope/vim-surround'
	
	" simple commenting
	Plug 'tpope/vim-commentary'

	" coffeescript syntax highlighting
	Plug 'kchmck/vim-coffee-script'

	" Makes a nice status bar at the bottom of vim
	Plug 'vim-airline/vim-airline'

	" Adds syntax highlighting for sxhkd files
	Plug 'kovetskiy/sxhkd-vim'

	" Allows for basic directory navigation in vim
	Plug 'scrooloose/nerdtree'

	" aesthetic color schemes
	Plug 'arcticicestudio/nord-vim'

	" Python autocompletion and other magic
	Plug 'davidhalter/jedi-vim'

call plug#end()



" Use the nord color scheme
colorscheme nord

" Enable the mouse in all vim modes
set mouse=a

" Some basics:
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
	" highlight the current line
	set cursorline

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" toggle nerdtree
map <leader>f :NERDTreeToggle<CR>

" spellcheck
map <leader>o :setlocal spell! spelllang=en_us<CR>

" turn off highlighting in searches
map <leader>h :nohlsearch<CR>

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Copy selected text to system clipboard:
	vnoremap <C-c> "+y
	map <C-p> "+P

" Arrow keys are for the weak! Turn them off.
	noremap <Up> <nop>
	noremap <Down> <nop>
	noremap <Left> <nop>
	noremap <Right> <nop>

" Set python3 executable since virtualenv messes things up when nvim looks for 'python' in path
	" Note: this is where it is installed on the macbook
	let g:python3_host_prog = '/usr/bin/python3'

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compile <c-r>%<CR>
