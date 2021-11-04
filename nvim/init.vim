" Created by 1478zhcy on January 13, 2021.
" The purpose of writing this configuration
" file is to unify the experience of using
" Vim and Neovim on different platforms
" according to my personal preferences.

" Edit config
set expandtab
set softtabstop=2
set shiftwidth=2
set nobackup
set noswapfile
set ignorecase
set smartcase
set autoindent
set nocompatible
set completeopt=menu,menuone,noselect
set list
set hidden
set includeexpr=substitute(v:fname,'\\.','/','g')

" UI config
set number
set relativenumber
set wrap
set linebreak
set showbreak=>>
set hlsearch
set ruler
set mouse=a
set showcmd
set laststatus=2
set belloff=all
set termguicolors
set wildmenu
set title
set signcolumn=yes
set cursorline
set conceallevel=1

" Unicode config
set encoding=utf-8
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936

" Keymap config
let mapleader=" "
nnoremap <silent> <leader><leader> :nohlsearch<CR>
cmap <C-p> <Up>
cmap <C-n> <Down>

" Language config
set shortmess=tI
set langmenu=en_US.UTF-8

" Fcitx5 auto switch
autocmd InsertLeave * :silent !fcitx5-remote -c

" Neovim config
if has("nvim")
" Colorscheme config
let g:tokyonight_transparent = 0
let g:tokyonight_style = 'storm'
let g:tokyonight_sidebars = [ "outline", "packer" ]
colorscheme tokyonight

lua << EOF
require("impatient").enable_profile()
require "init"
require "packer_compiled"
EOF
endif