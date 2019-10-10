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

	" Makes a nice status bar at the bottom of vim
	Plug 'vim-airline/vim-airline'

	" Adds syntax highlighting for sxhkd files
	Plug 'kovetskiy/sxhkd-vim'

	" Allows for basic directory navigation in vim
	Plug 'scrooloose/nerdtree'

call plug#end()


" Tells vim what background color you're using for the terminal window. If bg=dark, 
" it'll adjust text colors so that they can be seen easily on a dark background.
set bg=dark

" Enable the mouse in all vim modes
set mouse=a

" Some basics:
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" toggle nerdtree
map <leader>n :NERDTreeToggle<CR>
