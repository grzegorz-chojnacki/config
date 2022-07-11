syntax match commonIdentifier /\<\I\i*\>/
syntax match commonConstant /\<[A-Z_][A-Z0-9_]*\>/
syntax match commonFunction /\<\I\i*\>\ze\s*(/

highlight link commonIdentifier Identifier
highlight link commonConstant Constant
highlight link commonFunction Function
