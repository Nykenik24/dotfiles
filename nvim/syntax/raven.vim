" vim: syntax=raven
" Simple syntax file for raven language

" -------------------------------
" Define keywords
" -------------------------------
syn keyword ravenKeyword func if else switch case default while for return throw struct enum const let self in import new repeat until defer try catch
syn keyword ravenConcurrencyKeyword channel spawn send received wait
syn keyword ravenStructKeyword private self
syn keyword ravenOperatorKeyword or and

" -------------------------------
" Define types
" -------------------------------
syn keyword ravenType boolean string void type
syn match ravenType "\<\(int\|uint\|float\)\(8\|16\|32\|64\)\?\>"

" -------------------------------
" Define comments
" -------------------------------
" Single-line comments start with //
syn match ravenComment "//.*$"

" -------------------------------
" Define numbers
" -------------------------------
syn match ravenNumber "\<\d\+\>"
syn match ravenNumber "0x[a-fA-F0-9]\+"
syn match ravenNumber "0b[10]\+"

" -------------------------------
" Define strings
" -------------------------------
syn region ravenString start=+"+ end=+"+ contains=ravnEscape,ravnInterpolation
syn match ravenEscape "\\."
syn match ravenInterpolation "\${[^}]\+}"

" -------------------------------
" Define tags
" -------------------------------
syn match ravenTag "@'\([^']*\)'"

" -------------------------------
" Define members
" -------------------------------
syn match ravenMember "[a-zA-Z_][a-zA-Z0-9_]*\.\zs[a-zA-Z_][a-zA-Z0-9_]*\ze"

" -------------------------------
" Define decorators
" -------------------------------
syn match ravenDeco "#[^\S]\+"

" -------------------------------
" Define operators
" -------------------------------
syn match ravenOperator ":="
syn match ravenOperator "=="
syn match ravenOperator ">="
syn match ravenOperator "<="
syn match ravenOperator "!="
syn match ravenOperator "?"
syn match ravenOperator "++"
syn match ravenOperator "--"

" -------------------------------
" Define function calls
" -------------------------------
syn match ravenFunc /\<[a-zA-Z_][a-zA-Z0-9_]*\>\ze(.*)/

" -------------------------------
" Define delimeters
" -------------------------------
syn match ravenDelim "[{}]"

" -------------------------------
" Highlighting
" -------------------------------
hi def link ravenKeyword Keyword
hi ravenConcurrencyKeyword guifg=LightRed
hi ravenStructKeyword guifg=DarkCyan
hi ravenOperatorKeyword guifg=LightMagenta
hi def link ravenType Type
hi def link ravenComment Comment
hi def link ravenNumber Number
hi def link ravenString String
hi def link ravenInterpolation SpecialChar
hi def link ravenEscape SpecialChar
hi def link ravenTag Constant
hi def link ravenOperator Operator
hi def link ravenFunc Function
hi ravenDeco guifg=LightGreen
hi def link ravenDelim Delimeter
hi ravenMember guifg=DarkYellow

" Mark this buffer as using raven syntax
let b:current_syntax = "raven"


