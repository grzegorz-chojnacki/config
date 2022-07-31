highlight clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "dim"
let g:VM_theme_set_by_colorscheme = 1

" Syntax
highlight Identifier      ctermfg=1                 cterm=none
highlight Constant        ctermfg=2
highlight Type            ctermfg=3
highlight String          ctermfg=4
highlight Statement       ctermfg=5
highlight Function        ctermfg=6
highlight Ignore          ctermfg=7
highlight Comment         ctermfg=8                 cterm=italic
highlight! link PreProc Statement
highlight! link Character String
highlight! link Typedef Type

" Editor
highlight LineNr          ctermfg=8    ctermbg=0    cterm=none
highlight StatusLine      ctermfg=7    ctermbg=0    cterm=bold
highlight! link VertSplit LineNr

highlight MoreMsg         ctermfg=2
highlight ModeMsg         ctermfg=1                 cterm=bold
highlight Question        ctermfg=3                 cterm=bold

highlight TabLine         ctermfg=8    ctermbg=0    cterm=none
highlight TabLineSel      ctermfg=7    ctermbg=0    cterm=bold
highlight! link TabLineFill TabLine

highlight Title           ctermfg=5
highlight ColorColumn                  ctermbg=8
highlight SignColumn                   ctermbg=0
highlight Conceal         ctermfg=8    ctermbg=0
highlight Folded          ctermfg=5    ctermbg=0
highlight! link FoldColumn Folded

highlight Cursor          ctermfg=0    ctermbg=1
highlight CursorLineNr    ctermfg=7                 cterm=none
highlight CursorLine                                cterm=none
highlight TermCursor      ctermfg=1    ctermbg=0
highlight Pmenu           ctermfg=7    ctermbg=0
highlight PmenuSel        ctermfg=0    ctermbg=1    cterm=none
highlight PmenuSbar                    ctermbg=0
highlight! link PmenuThumb PmenuSel
highlight! link WildMenu PmenuSel

" Errors, warnings and text statuses
highlight WarningMsg      ctermfg=2
highlight Underlined      ctermfg=3                 cterm=underline
highlight Todo            ctermfg=3    ctermbg=none cterm=italic
highlight Error           ctermfg=1    ctermbg=none
highlight! link ErrorMsg Error

" Version control
highlight DiffAdd         ctermfg=5    ctermbg=0
highlight DiffChange      ctermfg=4    ctermbg=0
highlight DiffDelete      ctermfg=1    ctermbg=0
highlight DiffText        ctermfg=2    ctermbg=0    cterm=bold
highlight! link DiffAdded DiffAdd
highlight! link DiffRemoved DiffDelete
highlight! link GitGutterAdd DiffAdd
highlight! link GitGutterChange DiffChange
highlight! link GitGutterDelete DiffDelete

highlight! link GitGutterAddLineNr DiffAdd
highlight! link GitGutterChangeLineNr DiffChange
highlight! link GitGutterDeleteLineNr DiffDelete
highlight! link GitGutterChangeDeleteLineNr DiffChange

" Selection
highlight Visual          ctermfg=7    ctermbg=8
highlight Search          ctermfg=1    ctermbg=8
highlight MatchParen      ctermfg=1    ctermbg=8    cterm=bold
highlight IncSearch       ctermfg=3    ctermbg=8    cterm=bold

" Spelling
highlight SpellBad        ctermfg=1    ctermbg=none cterm=underline
highlight SpellRare       ctermfg=2    ctermbg=none cterm=underline
highlight SpellLocal      ctermfg=3    ctermbg=none cterm=underline
highlight SpellCap        ctermfg=7    ctermbg=none cterm=underline

" Whitespace and other
match TrailingSpace /\s\+$/
highlight Special         ctermfg=5
highlight SpecialKey      ctermfg=8
highlight NonText         ctermfg=8
highlight Directory       ctermfg=4
highlight Whitespace      ctermfg=8
highlight! link TrailingSpace Error

" TreeSitter
highlight link TSVariable Identifier
highlight link TSVariableBuiltin Type
highlight link TSConstructor Type
highlight link TSPunctBracket Ignore
highlight link TSPunctDelimiter Ignore
highlight link TSTag Identifier
highlight link TSTagDelimiter TSTag

" HTML
highlight link TSTagAttribute Constant
highlight link htmlTSOperator String
" CSS
highlight link cssTSType Identifier
highlight link cssTSProperty Constant
" Python
highlight link pythonTSFuncBuiltin Function
" JSON
highlight link jsonTSLabel Identifier
highlight link json5TSKeyword jsonTSLabel
" Markdown
highlight link markdownTSTitle Identifier
highlight link markdownTSPunctSpecial markdownTSTitle

" highlight VM_Cursor       ctermfg=3    ctermbg=8
" highlight VM_Insert       ctermfg=0    ctermbg=3
" highlight VM_Extend       ctermfg=1    ctermbg=8
" highlight! link VM_Mono VM_Cursor
