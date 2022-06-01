
syntax match cIdentifier /\<\I\i*\>/
highlight link cIdentifier Identifier

syntax match cFunction /\<\I\i*\>\ze\s*(/
highlight link cFunction Function

syntax match cConstant /\<[A-Z_][A-Z0-9_]*\>/
highlight link cConstant Constant

syntax keyword cStatement const
syntax keyword cMacro define undef pragma line warning warn error
highlight link cMacro Macro
