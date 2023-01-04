set nocompatible
colorscheme dim
filetype plugin indent on
syntax on
set confirm
set title
set encoding=utf-8
set backspace=indent,eol,start
set wildmenu
set wildmode=longest:full,full
set completeopt=menuone,preview,noinsert
set wildcharm=<Tab>
set splitbelow splitright
set number relativenumber
set signcolumn=number
set nowrap
set scrolloff=5
set sidescrolloff=5
set clipboard=unnamedplus
set synmaxcol=200
set mouse=nv
set cursorline
set laststatus=3
set lazyredraw
set statusline=%<[%n]%y%m%r %f%=%l,%c %p%% (%L)
set updatetime=200
set wildignore+=.git/*
set complete+=i,kspell
set spelllang=en_us,pl
set shellcmdflag+=\ -O\ globstar

" Search settings
set hlsearch
set ignorecase
set smartcase
set incsearch
set grepprg=rg\ -M80\ --vimgrep

" Don't pollute $HOME, store viminfo in .cache
set viminfo+=n~/.cache/viminfo

" Set backups
set backup
set backupdir-=.

" Undo settings
set undolevels=1000
set undodir=~/.cache/undodir
set undofile

" Whitespace settings
set autoindent
set smartindent
set smarttab
set expandtab
set shiftwidth=2
set shiftround
set tabstop=2
set softtabstop=2
set linebreak
set breakindent
set breakindentopt=sbr,shift:2,min:20
set showbreak=↪
set cpoptions+=n
set listchars=tab:» ,precedes:‹,extends:›,nbsp:␣,trail:·,lead:·,conceal:∷,leadmultispace:¦ 
set list

let mapleader = " "
let g:netrw_banner = 0
let g:vimsyn_embed = 0
let g:python_host_prog =  '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" GitGutter config
let g:gitgutter_close_preview_on_escape = 1
let g:gitgutter_sign_modified_removed = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = g:gitgutter_sign_removed
let g:gitgutter_sign_removed_above_and_below = g:gitgutter_sign_removed

lua << EOF
-- Ensure packer is installed
-- if vim.fn.empty(vim.fn.glob(vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim')) > 0 then
  require('packer').startup(function(use)
    use 'airblade/vim-gitgutter'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/playground'
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'
    use 'wbthomason/packer.nvim'
    use 'junegunn/vim-easy-align'
  end)

  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'bash',
      'c',
      'comment',
      'css',
      'html',
      'java',
      'javascript',
      'jsdoc',
      'json',
      'json5',
      'lua',
      'python',
      'vim',
      'yaml',
    },
    sync_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
  })
-- end
EOF

" Remove trailing whitespace and blank lines at the end of file
function! s:TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  keeppatterns %s/\v($\n\s*)+%$//e
  call winrestview(l:save)
endfun

" From http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html
" Makes * and # work on visual mode too.
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

function! s:ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Events
augroup custom
  " Clear all commands in group
  autocmd!

  " Set the cursor to I-beam upon exiting
  autocmd VimLeave * set guicursor=a:ver20

  " Set JSDoc include for js files (:checkpath to see what got included)
  autocmd FileType javascript set include=<reference\s*\ path=

  " Jump to last location without affecting the jump list
  autocmd BufRead * silent! normal g'"

  " Trim whitespace on write
  autocmd BufWritePre * call <SID>TrimWhitespace()

  " Auto source config on save
  autocmd BufWritePost $MYVIMRC source $MYVIMRC

  " Set default formatoptions for all files
  autocmd FileType * set formatoptions+=ro

  " Blink highlight on yanked text
  autocmd TextYankPost * silent! lua require('vim.highlight').on_yank()

  " Format tables
  autocmd FileType markdown vnoremap <leader>f !column -ts'\|' -o'\|'<CR>

  " Make quickfix lists modifiable by default, commit changes with <C-s>
  autocmd BufWinEnter quickfix set modifiable
        \ | setlocal errorformat=%f\|%l\ col\ %c-%k\|%m
        \ | nnoremap <buffer> <C-s> :cgetbuffer<CR>

  " Fix cursor placement on tabs in help files (align left)
  autocmd BufEnter * if &ft ==# 'help'
        \ | setlocal listchars=tab:\ \
        \ | set list
        \ | endif
augroup end


" Launch plugins
nnoremap <M-f> :FZF!<CR>
nnoremap <C-w>e :Ex<CR>
nnoremap <C-w><C-e> :Ex<CR>

" Git integration
nmap <C-_> gcc
xmap <C-_> gc
nnoremap <Leader>g :Git<CR>
nnoremap <Leader>G :GitGutterToggle<CR>

" Toggle buffer
nnoremap <leader><Tab> :b <Tab>

" Toggle options
nnoremap <silent> <M-z> :set wrap!<CR>
nnoremap <silent> <M-s> :let &scrolloff=((&scrolloff > 5) ? 5 : 99)<CR>
nnoremap <silent> <leader>v :let &virtualedit=(empty(&virtualedit) ? 'all' : '')<CR>
nnoremap <silent> <leader>z :let &foldcolumn=(&foldcolumn ? 0 : 1)<CR>
nnoremap <silent> <leader>sp :set spell!<CR>

" Clear last search and the command output at the bottom
nnoremap <silent> <Esc> :nohlsearch \| echon<CR>

" Don't allow to suspend
noremap <C-z> <Nop>
noremap <C-Z> <C-z>

" Run last used register
noremap Q @@

" Save file
nnoremap <silent> <C-s> :update<CR>

" Easier exit from terminal
tnoremap <Esc> <C-\><C-n>

" Natural/easier movement
noremap j gj
noremap k gk
noremap - $

" Pane resizing shortcuts
nnoremap <silent> <C-M-h> :vertical resize -1<CR>
nnoremap <silent> <C-M-j> :resize -1<CR>
nnoremap <silent> <C-M-k> :resize +1<CR>
nnoremap <silent> <C-M-l> :vertical resize +1<CR>

" Move lines
nnoremap <M-j> :m .+1<CR>
nnoremap <M-k> :m .-2<CR>
vnoremap <M-j> :m '>+1<CR>gv
vnoremap <M-k> :m '<-2<CR>gv

" Duplicate lines and ranges
nnoremap <M-K> :t-1<CR>
nnoremap <M-J> :t+0<CR>
xnoremap <M-K> :t'>+0<CR>gv
xnoremap <M-J> :t'<-1<CR>gv

" Replace all
nnoremap S :%s//g<Left><Left>
vnoremap S :s//g<Left><Left>

" Enable dot command in visual mode
vnoremap . :norm.<CR>

" Text indentation without loosing selection
vnoremap < <gv
vnoremap > >gv

" Keep register content when pasting over text in visual mode
vnoremap p "_dp
vnoremap P "_dP

" Proper start mappings in visual mode
xnoremap * :call <SID>VSetSearch('/')<CR>/<C-r>/<CR>
xnoremap # :call <SID>VSetSearch('?')<CR>?<C-r>/<CR>

" Search current word in the directory tree
nnoremap <leader>/ :vimgrep /<C-r><C-w>/g **/*
xnoremap <leader>/ "-ygv:<C-u>vimgrep /<C-r>-/g **/*

" Change next occurrence of word or selection
vmap s *``cgn
nnoremap s *``cgn

" Run macro at each line of visual selection
xnoremap @ :<C-u>call <SID>ExecuteMacroOverVisualRange()<CR>

" Get vim-syntax highlight group of a word under the cursor
nnoremap <F11> :TSHighlightCapturesUnderCursor<CR>
nnoremap <F10> :echo "hi<"
      \ . synIDattr(synID(line("."),col("."),1),"name") . "> trans<"
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
