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
set signcolumn=number
set nowrap
set ruler
set scrolloff=5
set sidescrolloff=5
set clipboard=unnamedplus
set mouse=nv
set cursorline
set laststatus=3
set statusline=%<[%n]%y%m%r\ %f%=%l,%c\ %p%%
set updatetime=200
set path+=**
set complete+=i,kspell
set spelllang=en_us,pl

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
set linebreak
set breakindent
set breakindentopt=sbr
set showbreak=↪
set cpoptions+=n
set listchars=tab:»\ ,precedes:‹,extends:›,nbsp:␣,trail:·,lead:·,conceal:∷
set list

let mapleader = " "
let g:python_host_prog =  '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

call plug#begin()
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
call plug#end()

" GitGutter config
let g:gitgutter_close_preview_on_escape = 1
let g:gitgutter_sign_modified_removed = '~'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_removed_above_and_below = '-'
let g:gitgutter_sign_removed = '-'

let g:markdown_fenced_languages = ['python', 'javascript', 'sh']

" Netrw config
let g:netrw_banner = 0

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

" Events
augroup custom
  " Clear all commands in group
  autocmd!

  " Jump to last location without affecting the jump list
  autocmd BufRead * silent! :normal g'"

  " Trim whitespace on write
  autocmd BufWritePre * :call <SID>TrimWhitespace()

  " Auto source config on save
  autocmd BufWritePost $MYVIMRC :source $MYVIMRC

  " Set default formatoptions for all files
  autocmd FileType * set formatoptions+=ro

  " Fix cursor placement on tabs in help files (align left)
  autocmd FileType help :setlocal listchars=tab:\ \ | set list

  " Blink highlight on yanked text
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()

  " Continue quotes in markdown
  autocmd FileType markdown setlocal comments=n:>
  " Format tables
  autocmd FileType markdown vnoremap <leader>f !column -t -s'\|' -o'\|'<CR>
  " Set color highlighting for arbitrary files
  autocmd FileType markdown
        \ silent! :syntax match HexColor /#\v(\x{8}|\x{6}|\x{4}|\x{3})/
        \ | call css_color#init('hex', 'none', 'HexColor')
augroup end


" Launch plugins
nnoremap <leader>G :GitGutterToggle<CR>
nnoremap <leader>g :Git<CR>
nnoremap <M-f> :FZF!<CR>
nnoremap <C-w>e :Ex<CR>
nnoremap <C-w><C-e> :Ex<CR>
nnoremap ga <Plug>(LiveEasyAlign)
xnoremap ga <Plug>(LiveEasyAlign)

" Toggle comment
nmap <C-_> gcc
xmap <C-_> gc

" Toggle buffer
nnoremap <Leader><Tab> :b <Tab>

" Toggle options
noremap <silent> <M-z> :set wrap!<CR>
noremap <silent> <Leader>v :let &virtualedit=(empty(&virtualedit) ? 'all' : '')<CR>
noremap <silent> <Leader>z :let &foldcolumn=(&foldcolumn ? 0 : 1)<CR>
noremap <silent> <Leader>sp :set spell!<CR>

" Clear last search and the command output at the bottom
nnoremap <silent> <Esc> :let @/='' \| echon<CR>

" Don't allow to suspend
noremap <C-z> <Nop>

" Save file
nnoremap <C-s> :w<CR>

" Easier exit from terminal
tnoremap <Esc> <C-\><C-n>

" Natural movement
noremap j gj
noremap k gk
noremap - $

" Quick newline
noremap <M-o> o<Esc>
noremap <M-O> O<Esc>

" Pane switching shortcuts
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Pane resizing shortcuts
nnoremap <silent> <C-M-h> :vertical resize -1<CR>
nnoremap <silent> <C-M-j> :resize +1<CR>
nnoremap <silent> <C-M-k> :resize -1<CR>
nnoremap <silent> <C-M-l> :vertical resize +1<CR>

" Move lines
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" Duplicate lines
nnoremap <M-t> :t+0<CR>
nnoremap <M-T> :t-1<CR>
xnoremap <M-t> :t '>+0<CR>gv
xnoremap <M-T> :t '<-1<CR>gv

" Replace all
nnoremap s :%s//g<Left><Left>
vnoremap s :s//g<Left><Left>

" Replace the next occurance of the last changed text
nnoremap c. /\V<C-r>"<CR>cgn<C-a><Esc>

" Enable dot command in visual mode
vnoremap . :norm.<CR>

" Text indentation without loosing selection
vnoremap < <gv
vnoremap > >gv

" Keep register content when pasting over text in visual mode
vnoremap p "_dP

" Change the word under the cursor
nnoremap <leader>c *``cgn
xnoremap * :call <SID>VSetSearch('/')<CR>/<C-r>=@/<CR><CR>
xnoremap # :call <SID>VSetSearch('?')<CR>?<C-r>=@/<CR><CR>
vmap <leader>c *``cgn

" Get highlight-groups of word under the cursor
nnoremap <F10> :echo "hi<"
  \ . synIDattr(synID(line("."),col("."),1),"name") . "> trans<"
  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
