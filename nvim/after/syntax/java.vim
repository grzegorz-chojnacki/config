syntax match javaIdentifier /\<[^0-9]\i*\>/ containedin=javaParenT
highlight link javaIdentifier Identifier

syntax match javaFunction /\<[^0-9]\i*\>\ze\w*(/ containedin=javaParenT
highlight link javaFunction Function

syntax match javaAngleBracket /[<>]/
highlight link javaAngleBracket Special

syntax keyword javaKeyword class import
highlight link javaKeyword Special
highlight link javaScopeDecl Special
highlight link javaClassDecl Special
highlight link javaStorageClass Special

highlight link javaDocParam Identifier


let java_highlight_java_lang_ids=1
highlight link javaC_JavaLang Type
