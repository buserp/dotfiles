-- Plugins
local vim = vim
local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug('loctvl842/monokai-pro.nvim') -- Monokai Pro theme.
Plug('mbbill/undotree') -- Visualize Vim's undo tree.
Plug('tpope/vim-sleuth') -- Detect shiftwidth and tabs/spaces, etc.
Plug('tpope/vim-commentary') -- Comment stuff out.
Plug('tpope/vim-eunuch') -- Rename, Move, Delete, etc.
Plug('Yggdroot/LeaderF')
vim.call('plug#end')

-- Colorscheme
require('monokai-pro').setup {}
vim.cmd([[colorscheme monokai-pro]])

-- Globals
vim.wo.number = true
vim.g.mapleader = ' '

-- When pressing enter, clear search highlighting and close Preview window
vim.keymap.set('n', '<CR>', ':nohl<CR>:pclose<CR><CR>')

-- Quicker window movement
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Toggle (u)ndo tree
vim.keymap.set('n', '<Leader>u', ':UndotreeToggle<CR>')

-- Neovide-specific options
if vim.g.neovide == true then
	vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end
