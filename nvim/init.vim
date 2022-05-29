" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" every time an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
"runtime! archlinux.vim

" If you prefer the old-style vim functionality, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" Do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1
colorscheme dim
filetype plugin on
syntax on

" Various basic settings
set nocompatible
set confirm
set title
set encoding=utf-8
set backspace=indent,eol,start
set wildmenu
set wildmode=longest:full,full
set completeopt=menuone,longest,preview,noselect
set wildcharm=<Tab>
set splitbelow splitright
set number relativenumber
set linebreak
set ruler
set scrolloff=5
set sidescrolloff=5
set clipboard=unnamedplus
set mouse=nv
set cursorline
set updatetime=200
set path+=**
set complete+=i,kspell

" Search settings
set hlsearch
set ignorecase
set smartcase
set incsearch

" Don't pollute $HOME, store viminfo in .cache
set viminfo+=n~/.cache/viminfo

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
set tabstop=2
set softtabstop=2
set breakindent
set breakindentopt=sbr
set showbreak=↪
set cpoptions+=n
set listchars=tab:»\ ,precedes:‹,extends:›,nbsp:␣,trail:·,lead:·,conceal:∷
set list

let mapleader = " "

call plug#begin()
Plug 'junegunn/vim-easy-align'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
call plug#end()

" Run EasyAlign in normal/visual mode
nnoremap ga <Plug>(LiveEasyAlign)
xnoremap ga <Plug>(LiveEasyAlign)

" More consistent visual mode vim-surround mapping
vmap s S

" Toggle NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>

" Launch Fugitive buffer
nnoremap <leader>g :Git<CR>

" Toggle comment
nmap <C-_> gcc
xmap <C-_> gc

" Remove trailing whitespace and blank lines at the end of file
function! s:TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  keeppatterns %s/\v($\n\s*)+%$//e
  call winrestview(l:save)
endfun


" Events
augroup custom
  " Clear all commands in group
  autocmd!

  " Jump to last location without affecting the jump list
  autocmd BufRead * silent! :normal g`"

  " Trim whitespace on write
  autocmd BufWritePre * :call <SID>TrimWhitespace()

  " Auto source config on save
  autocmd BufWritePost $MYVIMRC :source $MYVIMRC

  " Autosave on lost focus, don't care for errors
  autocmd BufLeave,FocusLost,CursorHold * silent! wall

  " Set default formatoptions for all files
  autocmd FileType * set formatoptions+=ro

  " Continue quotes in markdown
  autocmd FileType markdown setlocal comments=n:>

  " Set color highlighting for arbitrary files
  autocmd FileType markdown
        \ silent! :syntax match HexColor /#\v(\x{8}|\x{6}|\x{4}|\x{3})/
        \ | call css_color#init('hex', 'none', 'HexColor')
augroup end



""""""""""""""""""""""""""""""""""""""""""
" NORMAL, VISUAL, OPERATOR mode mappings "
""""""""""""""""""""""""""""""""""""""""""

" Spellchecker
set spelllang=en_us,pl
noremap <Leader>sp :set spell!<CR>

" Natural movement through wrapped lines
noremap j gj
noremap k gk

" More accessible EOL binding
noremap - $

" Repeat last used register
noremap Q @@

" Quick newline
noremap <M-o> o<Esc>
noremap <M-O> O<Esc>

" Toggle line wrapping
noremap <silent> <M-z> :set wrap!<CR>

" Virtual edit bindings
noremap <silent> <Leader>v :let &virtualedit=(empty(&virtualedit) ? 'all' : '')<CR>

" Toggle fold column
noremap <silent> <Leader>z :let &foldcolumn=(&foldcolumn ? 0 : 1)<CR>


""""""""""""""""""""""""
" NORMAL mode mappings "
""""""""""""""""""""""""

" Clear last search and the command output at the bottom
nnoremap <silent> <Esc> :let @/='' \| echon<CR>

" Save file
nnoremap <C-s> :w<CR>

" Pane switching shortcuts
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==

" Replace all
nnoremap S :%s//g<Left><Left>
vnoremap S :%s//g<Left><Left>

" Get highlight-groups of word under the cursor
nnoremap <F10> :echo "hi<"
  \ . synIDattr(synID(line("."),col("."),1),"name") . "> trans<"
  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Go to previous buffer
nnoremap <Leader>q :b #<CR>

" Open (and split) buffers
nnoremap <Leader><Tab> :b <Tab>
nnoremap <Leader>s<Tab> :sb <Tab>
nnoremap <Leader>v<Tab> :vsb <Tab>

" Replace the next occurance of the last changed text
nnoremap c. /\V<C-r>"<CR>cgn<C-a><Esc>

" Change the word under the cursor
nnoremap <leader>c *``cgn


""""""""""""""""""""""""
" VISUAL mode mappings "
""""""""""""""""""""""""

" From http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html
" Makes * and # work on visual mode too.
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

xnoremap * :call <SID>VSetSearch('/')<CR>/<C-r>=@/<CR><CR>
xnoremap # :call <SID>VSetSearch('?')<CR>?<C-r>=@/<CR><CR>
vmap <leader>c *``cgn

" Text indentation without loosing selection
vnoremap < <gv
vnoremap > >gv

" Enable dot command in visual mode
vnoremap . :norm.<CR>

" Keep register content when pasting over text in visual mode
vnoremap p "_dP

" Move lines
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Format markdown table
vnoremap <leader>f !column -t -s'\|' -o'\|'<CR>


""""""""""""""""""""""""""
" TERMINAL mode mappings "
""""""""""""""""""""""""""

" Easier terminal exit
tnoremap <Esc> <C-\><C-n>
