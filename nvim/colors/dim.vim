highlight clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "dim"
let g:VM_theme_set_by_colorscheme = 1

" Editor
highlight LineNr          ctermfg=8
highlight VertSplit       ctermfg=8    ctermbg=0    cterm=None
highlight StatusLineNC    ctermfg=8    ctermbg=0    cterm=None
highlight StatusLine      ctermfg=7    ctermbg=8    cterm=bold

highlight MoreMsg         ctermfg=2
highlight ModeMsg         ctermfg=1    cterm=bold
highlight Question        ctermfg=3    cterm=bold

highlight TabLine         ctermfg=4    ctermbg=0    cterm=None
highlight TabLineFill     ctermbg=0    cterm=None
highlight TabLineSel      ctermfg=3    ctermbg=0    cterm=bold

highlight Title           ctermfg=5
highlight ColorColumn     ctermbg=8
highlight SignColumn      ctermbg=0
highlight Folded          ctermfg=5    ctermbg=0
highlight FoldColumn      ctermfg=5    ctermbg=0
highlight Conceal         ctermfg=8    ctermbg=0

highlight Cursor          ctermfg=0    ctermbg=1
highlight CursorLineNr    ctermfg=7    cterm=None
highlight CursorLine      cterm=None
highlight CursorColumn    ctermbg=8
highlight TermCursor      ctermfg=1    ctermbg=0
highlight Pmenu           ctermfg=7    ctermbg=0
highlight PmenuSel        ctermfg=0    ctermbg=1    cterm=None
highlight PmenuSbar       ctermbg=0
highlight PmenuThumb      ctermbg=8
highlight link WildMenu PmenuSel

" Errors, warnings and text statuses
highlight Error           ctermfg=1    ctermbg=None
highlight Todo            ctermfg=3    ctermbg=None cterm=italic
highlight WarningMsg      ctermfg=2
highlight ErrorMsg        ctermfg=1    ctermbg=None
highlight Underlined      ctermfg=5    cterm=underline
highlight Ignore          ctermfg=7

" Diff
highlight DiffAdd         ctermfg=6    ctermbg=8    cterm=None
highlight DiffDelete      ctermfg=1    ctermbg=8    cterm=None
highlight DiffChange      ctermfg=2    ctermbg=8    cterm=None
highlight DiffText        ctermfg=2    ctermbg=8    cterm=None,bold
highlight GitGutterAdd    ctermfg=6
highlight GitGutterChange ctermfg=2
highlight GitGutterDelete ctermfg=1

" Selection
highlight Visual          ctermfg=7    ctermbg=8
highlight MatchParen      ctermfg=1    ctermbg=8    cterm=bold

" Highlight
highlight Search          ctermfg=1    ctermbg=8
highlight IncSearch       ctermfg=3    ctermbg=8    cterm=bold

" Spelling
highlight SpellBad        ctermfg=1    ctermbg=None cterm=underline
highlight SpellRare       ctermfg=2    ctermbg=None cterm=underline
highlight SpellLocal      ctermfg=3    ctermbg=None cterm=underline
highlight SpellCap        ctermfg=7    ctermbg=None cterm=underline

" Whitespace and other
match TrailingSpace /\s\+$/
highlight TrailingSpace   ctermfg=1
highlight Special         ctermfg=5
highlight SpecialKey      ctermfg=8
highlight NonText         ctermfg=8
highlight Directory       ctermfg=4
highlight Whitespace      ctermfg=8

" Syntax
highlight Comment         ctermfg=8    cterm=italic
highlight Constant        ctermfg=2
highlight Identifier      ctermfg=1    cterm=None
highlight Function        ctermfg=6
highlight String          ctermfg=4
highlight Character       ctermfg=4
highlight Statement       ctermfg=5
highlight PreProc         ctermfg=5
highlight Type            ctermfg=3
highlight link Typedef Type

highlight VM_Cursor       ctermfg=3    ctermbg=8
highlight VM_Insert       ctermfg=0    ctermbg=3
highlight VM_Extend       ctermfg=1    ctermbg=8
highlight link VM_Mono VM_Cursor
