" ================= General Settings ====================

set number
set spell spelllang=en_us
set wrap
set linebreak

" ==================== Indentation =======================
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

" Enable type file detection. Enable plugins. Load indent file
filetype on
filetype plugin on
filetype indent on

" Make wildmenu behave similar to Bash completion and ignore non vim files
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" turn on syntax highlighting
syntax on

" Remap escape to jk
inoremap jk <ESC>

"Plugin management
" call plug#begin()
"
" Plug 'tpope/vim-sensible'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-eunuch'
" Plug 'tpope/vim-surround'
" Plug 'github/copilot.vim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'scrooloose/nerdtree'
" Plug 'christoomey/vim-tmux-navigator'
"
" call plug#end()

