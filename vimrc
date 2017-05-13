let mapleader="\<Space>"
set nocompatible
filetype plugin indent on
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

set smarttab      " Make the tab key insert spaces or tabs to go to next indent
set expandtab     " Use spaces instead of tabs
set shiftwidth=4  " Use four spaces as indent size, by default

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use the system clipboard
set clipboard=unnamedplus

" Clear the last search
nnoremap <CR> :noh<CR>:pclose<CR><CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Easy paste/nopaste toggle
nnoremap <Leader>P :set paste!<CR>

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

" Searching
nnoremap <Leader>\ :Ag 
nnoremap <Leader>n :cnext<CR>
nnoremap <Leader>p :cprev<CR>

" Autoformat that sh*t
nnoremap <Leader>f :FormatCode<CR>

" Toggle Gundo
nnoremap <Leader>u :GundoToggle<CR>

" Toggle highlighting current column
nnoremap <Leader>c :set cursorcolumn!<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype-specific stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Elm
autocmd FileType elm setlocal shiftwidth=2
let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
""""""""""""""""""""""""""""""""""""

Plug 'tpope/vim-commentary'
Plug 'qpkorr/vim-bufkill'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
Plug 'tpope/vim-eunuch'
Plug 'itchyny/vim-haskell-indent'
Plug 'sjl/gundo.vim'
Plug 'sjl/splice.vim'
Plug 'google/vim-glaive'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'christoomey/vim-tmux-navigator'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ElmCast/elm-vim'
Plug 'pangloss/vim-javascript'
Plug 'dkarter/bullets.vim'
Plug 'davinche/godown-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'jpalardy/vim-slime'

" Source local plugins
if filereadable(glob("~/.vimrc.plugins"))
    source ~/.vimrc.plugins
endif

call plug#end()
call glaive#Install()


" Use tmux with vim-slime
let g:slime_target = "tmux"

" Colorscheme stuff
let g:airline#extensions#tabline#enabled = 1 " Display all buffers when there's only one tab open
set t_Co=256 " Required for molokai to work with 256-color terminal
set t_ut=    " http://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging
colorscheme molokai

" The Silver Searcher
" https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif
" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Additional sources
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable("~/.vimrc.local")
    source ~/.vimrc.local
endif
