let mapleader="\<Space>"
syntax on
set number " Turn line numbers on
set mouse=a " Enable the x-y tracking device
set cursorline " Underline where cursor is

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=200
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set hlsearch      " highlight search results
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Show complete command completion menu
set wildmenu

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
" Tabs and such
nnoremap <Leader>w :bd<CR>
nnoremap <Leader>W :BD<CR>
nnoremap <Leader>t :tabnew<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Additional sources
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(glob("~/.vimrc.plugins"))
    source ~/.vimrc.plugins
endif
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif
