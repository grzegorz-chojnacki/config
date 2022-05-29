highlight link pythonDecoratorName PreProc

syntax match pythonIdentifier /\<[^0-9]\i*\>/
highlight link pythonIdentifier Identifier

" Add underscores to numbers
syntax match pythonNumber "\<0[oO]\=[_0-7]\+[Ll]\=\>"
syntax match pythonNumber "\<0[xX]\[_0-9A-Fa-f]\+[Ll]\=\>"
syntax match pythonNumber "\<0[bB][_01]\+[Ll]\=\>"
syntax match pythonNumber "\<\%([1-9][_0-9]*\|0\)[Ll]\=\>"
syntax match pythonNumber "\<[_0-9]\+[jJ]\>"
syntax match pythonNumber "\<[_0-9]\+[eE][+-]\=[_0-9]\+[jJ]\=\>"
syntax match pythonNumber "\<[_0-9]\+\.\%([eE][+-]\=[_0-9]\+\)\=[jJ]\=\%(\W\|$\)\@="
syntax match pythonNumber "\%(^\|\W\)\zs[_0-9]*\.[_0-9]\+\%([eE][+-]\=[_0-9]\+\)\=[jJ]\=\>"

syntax match pythonConstant /\<[A-Z_][A-Z0-9_]\+\>/
highlight link pythonConstant Constant

syntax match pythonFunction /\<\i*\>\ze\w*(/ containedin=ALLBUT,pythonString,pythonRawString,pythonComment

" Syntax matching gets overriden by pythonFunction group
match pythonClass /\<class\>\s*\zs\<\i*\>/
highlight link pythonClass Type
