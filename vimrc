let mapleader="\<Space>"
syntax on
set number        " Turn line numbers on
set mouse=a       " Enable the x-y tracking device
set cursorline    " Underline where cursor is
set backspace=2   " Backspace deletes like most programs in insert mode

set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287

set history=200   " remember 200 years ago
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set hlsearch      " highlight search results
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set wildmenu      " Show complete command completion menu

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Display all open buffers when there's only one tab
let g:airline#extensions#tabline#enabled = 1

" Clear the last search
nnoremap <CR> :noh<CR><CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Easy paste/nopaste toggle
nnoremap <Leader>p :set paste!<CR>

" Open file in same directory as current buffer
nnoremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Tab and buffer management
nnoremap <Leader>w :bd<CR>
nnoremap <Leader>W :BD<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>h :bp<CR>
nnoremap <Leader>l :bn<CR>
nnoremap <Leader>j gt
nnoremap <Leader>k gT

" Autoformat that sh*t
nnoremap <Leader>f :FormatCode<CR>

" Toggle Gundo
nnoremap <Leader>u :GundoToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " be iMproved, required
filetype off     " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
""""""""""""""""""""""""""""""""""""

Plugin 'tpope/vim-commentary'
Plugin 'qpkorr/vim-bufkill'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-eunuch'
Plugin 'itchyny/vim-haskell-indent'
Plugin 'sjl/gundo.vim'
Plugin 'google/vim-glaive'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'christoomey/vim-tmux-navigator'

" Source local plugins
if filereadable(glob("~/.vimrc.plugins"))
    source ~/.vimrc.plugins
endif

" All of your Plugins must be added before the following line
call vundle#end()
call glaive#Install() " glaive#Install() should go after call vundle#end()
filetype plugin indent on    " required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Additional sources
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif
