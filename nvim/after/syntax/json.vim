highlight link jsonKeyword Identifier
highlight link jsonBraces Ignore
highlight link jsonNull Constant

" Differentiate between keyword and string value quotes for better highlight
syntax region jsonKeyword matchgroup=jsonQuoteKeyword start=/"/ end=/"\ze[[:blank:]\r\n]*\:/ contained
syntax region jsonString oneline matchgroup=jsonQuoteString start=/"/ skip=/\\\\\|\\"/ end=/"/ concealends contains=jsonEscape contained
highlight link jsonQuoteString String
highlight link jsonQuoteKeyword Identifier
