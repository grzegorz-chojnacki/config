set nocompatible
colorscheme dim
filetype plugin on
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
" Required by telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

Plug 'ap/vim-css-color'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
call plug#end()

" let g:coq_settings = {
"       \ 'auto_start': 'shut-up',
"       \ 'keymap': { 'jump_to_mark': '<c-m>' },
"       \ 'display': {
"         \ 'pum': { 'source_context': [' [',']'], 'fast_close': v:false },
"         \ 'icons': { 'mode': 'none' }}}

" Embedded lua config
lua << EOF
require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "vim",
    "lua",
    "bash",
    "markdown",
    "yaml",
    "html",
    "css",
    "comment",
    "javascript",
    "java",
    "json",
    "json5",
    "jsdoc",
    "python",
    "c",
    "latex",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
})

require('telescope').setup({
  defaults = {
    mappings = {
      i = { ['<Esc>'] = require('telescope.actions').close }
    },
  }
})
EOF

" GitGutter config
let g:gitgutter_close_preview_on_escape = 1
let g:gitgutter_sign_modified_removed = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = g:gitgutter_sign_removed
let g:gitgutter_sign_removed_above_and_below = g:gitgutter_sign_removed

let g:markdown_fenced_languages = ['python', 'javascript', 'sh', 'bash', 'c', 'yaml']

" Netrw config
let g:netrw_banner = 0

" Telescope config
nnoremap <leader>ff <Cmd>Telescope find_files<CR>
nnoremap <leader>fh <Cmd>Telescope find_files hidden=true no_ignore=true<CR>
nnoremap <leader>ft <Cmd>Telescope help_tags<CR>
nnoremap <leader>fg <Cmd>Telescope live_grep<CR>

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

  " Set the cursor to I-beam upon exiting
  autocmd VimLeave * set guicursor=a:ver20

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

  " Continue quotes in markdown
  autocmd FileType markdown setlocal comments=n:>
  " Format tables
  autocmd FileType markdown vnoremap <leader>f !column -t -s'\|' -o'\|'<CR>

  " Make quickfix lists modifiable by default, commit changes with <C-s>
  autocmd BufWinEnter quickfix set modifiable | setlocal errorformat=%f\|%l\ col\ %c-%k\|%m | nnoremap <buffer> <C-s> :cgetbuffer<CR>

  " Set color highlighting for arbitrary files
  autocmd FileType markdown
        \ silent! :syntax match HexColor /#\v(\x{8}|\x{6}|\x{4}|\x{3})/
        \ | call css_color#init('hex', 'none', 'HexColor')

  " Fix cursor placement on tabs in help files (align left)
  autocmd BufEnter * if &ft ==# 'help'
        \ | setlocal listchars=tab:\ \
        \ | set list
        \ | endif
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

" Save file
nnoremap <C-s> :w<CR>

" Easier exit from terminal
tnoremap <Esc> <C-\><C-n>

" Natural movement
noremap j gj
noremap k gk
noremap - g$

" Pane switching shortcuts
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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
nnoremap s :%s//g<Left><Left>
vnoremap s :s//g<Left><Left>

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

" Change next occurence of word or selection
vmap <leader>c *``cgn
nnoremap <leader>ciw *``cgn
nnoremap <leader>c. /\V<C-r>"<CR>cgn<C-a><Esc>

" Get tree-sitter or vim-syntax highlight group of a word under the cursor
nnoremap <F11> :TSHighlightCapturesUnderCursor<CR>
nnoremap <F10> :echo "hi<"
      \ . synIDattr(synID(line("."),col("."),1),"name") . "> trans<"
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
