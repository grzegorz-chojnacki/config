runtime after/syntax/common.vim

highlight link pythonDecoratorName PreProc

syntax keyword pythonConstant False None True
highlight link pythonConstant Constant

syntax match pythonSpecialString /\<[fru]\ze['"]/
highlight link pythonSpecialString Statement

" Add underscores to numbers
syntax match pythonNumber "\<0[oO]\=[_0-7]\+[Ll]\=\>"
syntax match pythonNumber "\<0[xX]\[_0-9A-Fa-f]\+[Ll]\=\>"
syntax match pythonNumber "\<0[bB][_01]\+[Ll]\=\>"
syntax match pythonNumber "\<\%([1-9][_0-9]*\|0\)[Ll]\=\>"
syntax match pythonNumber "\<[_0-9]\+[jJ]\>"
syntax match pythonNumber "\<[_0-9]\+[eE][+-]\=[_0-9]\+[jJ]\=\>"
syntax match pythonNumber "\<[_0-9]\+\.\%([eE][+-]\=[_0-9]\+\)\=[jJ]\=\%(\W\|$\)\@="
syntax match pythonNumber "\%(^\|\W\)\zs[_0-9]*\.[_0-9]\+\%([eE][+-]\=[_0-9]\+\)\=[jJ]\=\>"
