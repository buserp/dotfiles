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
" coc.vim changes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

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
" Autocomplete.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
