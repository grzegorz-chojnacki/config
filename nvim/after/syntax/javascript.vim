syntax keyword javaScriptReserved let var function

syntax match javaScriptIdentifier /\<[^0-9]\i*\>/
syntax match javaScriptFunction /\<\i*\>\ze\w*(/

syntax match javaScriptArrow /=>/
highlight link javaScriptArrow Special

highlight link javaScriptBraces Ignore
highlight link javaScriptNumber Constant
highlight link javaScriptNull Constant
highlight link javaScriptMember Type
