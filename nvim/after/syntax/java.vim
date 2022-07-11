runtime after/syntax/common.vim

syntax match javaType /\<[A-Z]\i*\>/
highlight link javaType Type

syntax clear javaParenT javaParenError

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
