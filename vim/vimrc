" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" iverytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1
colorscheme dim
filetype plugin on
syntax on

set nocompatible
set wildmenu
set wildmode=full
set splitbelow splitright
set number relativenumber
set linebreak
set showmatch
set scrolloff=5

set hlsearch
set ignorecase
set smartcase
set incsearch
set autoindent

set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2

set ruler

set undolevels=1000
set backspace=indent,eol,start
set encoding=utf-8

" Don't pollute $HOME, store viminfo in .cache
set viminfo+=n~/.cache/viminfo

let mapleader = " "

" Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

" Remove trailing whitespace on write
autocmd BufWritePre * %s/\s\+$//e

" Autosave on lost focus
autocmd FocusLost * :x

" Replace all
nnoremap S :%s//g<Left><Left>

" Replace all occurences of a word under the cursor
nnoremap <Leader>* :%s///g<Left><Left>

" Pane switching shortcuts
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Enable dot command in visual mode
vnoremap . :norm.<CR>

" Change cursor shape based on the mode
let &t_ti.="\e[3 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[3 q"
let &t_te.="\e[5 q"

