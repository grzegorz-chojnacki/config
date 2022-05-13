highlight clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "dim"

" Editor
highlight LineNr        ctermfg=8
highlight VertSplit     ctermfg=8   ctermbg=0   cterm=NONE
highlight StatusLineNC  ctermfg=8   ctermbg=0   cterm=NONE
highlight StatusLine    ctermfg=7   ctermbg=8   cterm=bold

highlight MoreMsg       ctermfg=2
highlight ModeMsg       ctermfg=1               cterm=bold
highlight Question      ctermfg=3               cterm=bold

highlight TabLine       ctermfg=4   ctermbg=0   cterm=NONE
highlight TabLineFill               ctermbg=0   cterm=NONE
highlight TabLineSel    ctermfg=3   ctermbg=0   cterm=bold

highlight Title         ctermfg=5
highlight ColorColumn               ctermbg=8
highlight SignColumn                ctermbg=0
highlight Folded        ctermfg=5   ctermbg=0
highlight FoldColumn    ctermfg=5   ctermbg=0
highlight Conceal       ctermfg=8   ctermbg=0

highlight Cursor        ctermfg=0   ctermbg=1
highlight CursorLineNr  ctermfg=7                cterm=NONE
highlight CursorLine                             cterm=NONE
highlight CursorColumn              ctermbg=8
highlight TermCursor    ctermfg=1   ctermbg=0
highlight Pmenu         ctermfg=7   ctermbg=0
highlight PmenuSel      ctermfg=0   ctermbg=1    cterm=NONE
highlight PmenuSbar                 ctermbg=0
highlight PmenuThumb                ctermbg=8
highlight link WildMenu PmenuSel

" Errors, warnings and text statuses
highlight Error         ctermfg=1   ctermbg=NONE
highlight Todo          ctermfg=3   ctermbg=NONE cterm=italic
highlight WarningMsg    ctermfg=2
highlight ErrorMsg      ctermfg=1   ctermbg=NONE
highlight Underlined    ctermfg=5                cterm=underline
highlight Ignore        ctermfg=7

" Diff
highlight DiffAdd       ctermfg=5   ctermbg=8    cterm=NONE
highlight DiffDelete    ctermfg=1   ctermbg=8    cterm=NONE
highlight DiffChange    ctermfg=2   ctermbg=8    cterm=NONE
highlight DiffText      ctermfg=2   ctermbg=8    cterm=NONE,bold

" Selection
highlight Visual        ctermfg=7   ctermbg=8
highlight MatchParen    ctermfg=1   ctermbg=8    cterm=bold

" Highlight
highlight Search        ctermfg=1   ctermbg=8
highlight IncSearch     ctermfg=3   ctermbg=8    cterm=bold

" Spelling
highlight SpellBad      ctermfg=1   ctermbg=NONE cterm=underline
highlight SpellRare     ctermfg=2   ctermbg=NONE cterm=underline
highlight SpellLocal    ctermfg=3   ctermbg=NONE cterm=underline
highlight SpellCap      ctermfg=7   ctermbg=NONE cterm=underline

" Whitespace and other
match TrailingSpace /\s\+$/
highlight TrailingSpace ctermfg=1
highlight Special       ctermfg=5
highlight SpecialKey    ctermfg=8
highlight NonText       ctermfg=8
highlight Directory     ctermfg=4
highlight Whitespace    ctermfg=8

" Syntax
highlight Comment       ctermfg=8                cterm=italic
highlight Constant      ctermfg=2
highlight Identifier    ctermfg=1                cterm=NONE
highlight Function      ctermfg=6
highlight String        ctermfg=4
highlight Character     ctermfg=4
highlight Statement     ctermfg=5
highlight PreProc       ctermfg=5
highlight Type          ctermfg=3
highlight link Typedef Type

" HTML
highlight htmlArg       ctermfg=2
highlight htmlTag       ctermfg=1
highlight link htmlTagName htmlTag
