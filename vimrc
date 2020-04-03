""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The basics
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader="\<Space>" " Use spacebar as <Leader>
set nocompatible " This is Vim, not Vi
filetype plugin indent on " Enable filetype detection, plugin loading, indenting
syntax enable " Enable syntax highlighting

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" When pressing enter, clear search highlighting and close Preview window
nnoremap <CR> :noh<CR>:pclose<CR><CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Toggle (p)aste
nnoremap <Leader>p :set paste!<CR>
" (e)dit file in same directory as current buffer
nnoremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Kill buffer and close (w)indow
nnoremap <Leader>w :bd<CR>
" Kill buffer without closing (W)indow
nnoremap <Leader>W :BD<CR>
" Create a new (t)ab
nnoremap <Leader>t :tabnew<CR>
" (h)ead left in the tab list
nnoremap <Leader>h gT
" (l)eap right in the tab list
nnoremap <Leader>l gt<CR>
" (j)ump down in the file list
nnoremap <Leader>j :bn<CR>
" (k)limb up in the file list
nnoremap <Leader>k :bp<CR>

" Toggle the (u)ndo tree
nnoremap <Leader>u :UndotreeToggle<CR>

" Toggle the (n)erd (file explore) tree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Toggle (c)olumn highlighting
nnoremap <Leader>c :set cursorcolumn!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Basics.
set number        " Turn line numbers on
set mouse=a       " Enable the x-y tracking device
set cursorline    " Underline where cursor is
set backspace=2   " Backspace deletes like most programs in insert mode

" Swap and backup files.
set nobackup
set nowritebackup
set noswapfile    " Don't keep a swap file.

" Visuals.
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set hlsearch      " highlight search results
set laststatus=2  " Always display the status line
set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace.

" Enhancements.
set autowrite         " Automatically :write before running commands
set smarttab          " Make the tab key insert spaces or tabs to go to next indent
set history=200       " remember 200 years ago
set clipboard=unnamed " Use the system clipboard.

" Spaces or tabs?
set expandtab     " Use spaces instead of tabs
set shiftwidth=4  " Use four spaces as indent size, by default

" Searching.
set ignorecase    " Do case-insensitive searching...
set smartcase     " ...unless the search contains capital letters
set incsearch     " do incremental searching

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin($HOME . '/.vim/plugged')
""""""""""""""""""""""""""""""""""""

" Language support
Plug 'ElmCast/elm-vim' " Elm Language support
  let g:elm_format_autosave = 1
  let g:netrw_list_hide= '^.*repl-temp-.*$'
Plug 'pangloss/vim-javascript' " Better JavaScript support.
Plug 'Glench/Vim-Jinja2-Syntax' " Jinja2 support.
Plug 'PProvost/vim-ps1' " PowerShell support.
Plug 'elixir-editors/vim-elixir' " Elixir support
Plug 'chr4/nginx.vim' " NGINX configuration support
Plug 'jvirtanen/vim-cocoapods' " CocoaPods support.
Plug 'udalov/kotlin-vim' " Kotlin support.
Plug 'toyamarinyon/vim-swift' " Swift support.
Plug 'vim-scripts/proguard.vim' " ProGuard support.
Plug 'dzeban/vim-log-syntax' " Colorized logfiles.
Plug 'leafgarland/typescript-vim' " TypeScript support.
Plug 'neovimhaskell/haskell-vim' " Haskell support.
Plug 'itchyny/vim-haskell-indent' " Haskell indentation support.
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Golang support.
Plug 'supercollider/scvim' " SuperCollider support.
" Editor enhancements
Plug 'tpope/vim-commentary' " Comment stuff out.
Plug 'qpkorr/vim-bufkill' " Delete buffers without closing splits.
Plug 'tomasr/molokai' " Sublime Text 2 default colorscheme.
Plug 'tpope/vim-eunuch' " Rename, Move, Delete, etc.
Plug 'mbbill/undotree' " UndoTree, visualizes Vim's undo tree.
Plug 'nathanaelkane/vim-indent-guides' " Indentation guides.
Plug 'scrooloose/nerdtree' " Browse filesystem nicely.
Plug 'jceb/vim-hier' " Highlight quickfix entries.
Plug 'prabirshrestha/async.vim' " Use asynchronous code
Plug 'prabirshrestha/vim-lsp' " Language Server Protocol
" Integration with other tools
Plug 'christoomey/vim-tmux-navigator' " Seamless tmux and vim pane navigation.
Plug 'davinche/godown-vim' " Easy Markdown previews.
Plug 'jpalardy/vim-slime' " Send text to a REPL, tmux pane, etc.
  let g:slime_target = "tmux"
Plug 'reedes/vim-pencil' " Use Vim to edit prose.

" Source additional plugins
let s:additional_plugins = $HOME . '/.vimrc.plugins'
if filereadable(s:additional_plugins)
    execute 'source ' . s:additional_plugins
endif

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual style
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme molokai
set t_Co=256 " Required for molokai to work with 256-color terminal
set t_ut=    " http://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging
hi Statusline ctermfg=white ctermbg=black

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Additional sources
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vimrc_local = $HOME . '/.vimrc.local'
if filereadable(s:vimrc_local)
    execute 'source ' . s:vimrc_local
endif
