" Set leader key for future commands
let mapleader = ","

" {{{ plugins
" {{{ on vim startup
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
" }}}
" {{{ Install plugins
call plug#begin('~/.config/nvim/plugged')
    " stop using inefficient movement!
    Plug 'takac/vim-hardtime'

    "fuzzy finding
    Plug 'junegunn/fzf'

    " anything that surrounds: parens, brackets, quotes, tags, etc.
    Plug 'tpope/vim-surround'
    
    " simple commenting
    Plug 'tpope/vim-commentary'

    " git in vim!
    Plug 'tpope/vim-fugitive'

    " coffeescript syntax highlighting
    Plug 'kchmck/vim-coffee-script'

    " Makes a nice status bar at the bottom of vim
    Plug 'vim-airline/vim-airline'

    " Adds syntax highlighting for sxhkd files
    Plug 'kovetskiy/sxhkd-vim'

    " Syntax highlighting for typescript
    Plug 'leafgarland/typescript-vim'

    " Syntax highlighting for jsx in typescript
    Plug 'peitalin/vim-jsx-typescript'

    " Allows for basic directory navigation in vim
    Plug 'scrooloose/nerdtree'

    " See hex colors in the editor
    Plug 'ap/vim-css-color'

    " aesthetic color schemes
    Plug 'arcticicestudio/nord-vim'

    " python syntax folding
    Plug 'tmhedberg/SimpylFold'

    " automatically close brackets and quotes
    Plug 'jiangmiao/auto-pairs'

    " the uncompromising Python code formatter
    Plug 'psf/black', { 'branch': 'stable' }

    " make hex or color strings show up as that color in the editor
    Plug 'ap/vim-css-color'

call plug#end()
" }}}
" }}}

"{{{ settings
    " Use the nord color scheme
    colorscheme nord

    " Enable the mouse in all vim modes
    set mouse=a

"{{{ basics
" Some basics:
    " disable backwards compatibility with vi and enter the 21st century
    set nocompatible 
    filetype plugin on
    syntax on
    set encoding=utf-8
    set number relativenumber
    " highlight the current line
    set cursorline

    " Make tab characters look like 4 spaces
    set softtabstop=4
    set shiftwidth=4
    set noexpandtab
    autocmd FileType typescript setlocal expandtab
"}}}
" Disables automatic commenting on newline:
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" automatically load up this file whenever it changes in vim
    autocmd BufWritePost *init.vim source %
    " typescript syntax highlighting
    " autocmd BufRead,BufNewFile *.tsx set filetype=typescript.tsx
    autocmd BufRead,BufNewFile *.tsx set filetype=typescript
    autocmd FileType typescript setlocal foldmethod=syntax
    autocmd FileType typescript set tabstop=2
    autocmd FileType typescript set softtabstop=2
    autocmd FileType typescript set shiftwidth=2

    autocmd BufRead init.vim set foldmethod=marker

    " turn off git branch info in status line. Clutters up the screen in splitview
    let g:airline_section_b = ""

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
    inoremap <Up> <nop>
    inoremap <Down> <nop>
    inoremap <Left> <nop>
    inoremap <Right> <nop>

" Set python3 executable since virtualenv messes things up when nvim looks for 'python' in path
    " Note: this is where it is installed on the macbook
    let g:python3_host_prog = expand('~/.virtual_envs/nvim/bin/python')

" turn on vim hardtime
    let g:hardtime_default_on = 1
    let g:hardtime_allow_different_key = 1

    let g:black_virtualenv = expand('~/.virtual_envs/nvim/')
    autocmd BufWritePre *.py execute ':Black'
"}}}

"{{{ custom commands
    " toggle nerdtree
    map <leader>f :NERDTreeToggle<CR>

    " spellcheck
    map <leader>s :setlocal spell! spelllang=en_us<CR>

    " use fuzzy-find to search for a file
    map <leader>d :FZF<CR>

    " compile tags for the current directory
    map <leader>n :!ctags -R --exclude=@$HOME/.config/.ctagsignore --python-kinds=-i .<CR>

    " save the file and run make test in the current directory
    map <leader>m :w<CR>:make test<CR>

    " turn off highlighting in searches
    map <leader>h :nohlsearch<CR>

    " Compile document, be it groff/LaTeX/markdown/etc.
    map <leader>c :w! \| !compile <c-r>%<CR>

    " Keep a banner listing the open tabs at the top
    let g:airline#extensions#tabline#enabled = 1

    " Case-insensitive search
    set ignorecase
    " Use case-sensitive search if you use a capital letter
    " https://vim.fandom.com/wiki/Searching#Case_sensitivity
    set smartcase

    " close buffer
    map <leader>x :bdelete<CR>

    " Read an empty HTML template and move cursor to title
    nnoremap <leader>html :-1read $HOME/.config/skeleton.html<CR>3jwf>a

    " search the current git directory for the word under the cursor
    " map <leader>a yiw:grep "<C-R>0" -irI insights tests<CR>
    map <leader>a yiw:G grep "<C-R>0" <CR>

    " copy current relative path to the clipboard
    map <leader>q :let @+ = expand("%")<CR>

    " run nosetests on file
    map <leader>w :!nosetests tests/shared/models/ tests/server/handlers/v2/test_project_handler.py<CR>

    " shortcut to edit this file
    map <leader>v :e ~/.config/nvim/init.vim<CR>

    " run typechecks on the working directory
    map <leader>t :make typecheck<CR>
" }}}
