" vim: syntax=csq
" Simple syntax file for C squared language

" -------------------------------
" Define keywords
" -------------------------------
syn keyword csqKeyword if else switch case default while for return throw const in import new until defer try catch func struct enum this
syn keyword csqRefKeyword ptr addr
syn keyword csqOperatorKeyword or and
syn keyword csqBuiltin true false nil

" -------------------------------
" Define types
" -------------------------------
syn keyword csqType bool string void type
syn match csqType "\<\(int\|uint\|float\)\(8\|16\|32\|64\)\?\>"
syn match csqType /\<[a-zA-Z_][a-zA-Z0-9_]*_t\>/

" -------------------------------
" Define comments
" -------------------------------
" Single-line comments start with //
syn match csqComment "//.*$"

" -------------------------------
" Define numbers
" -------------------------------
syn match csqNumber "\<\d\+\>"
syn match csqNumber "0x[a-fA-F0-9]\+"
syn match csqNumber "0b[10]\+"

" -------------------------------
" Define strings
" -------------------------------
syn region csqString start=+"+ end=+"+ contains=ravnEscape,ravnInterpolation
syn match csqEscape "\\."
syn match csqInterpolation "\${[^}]\+}"

" -------------------------------
" Define tags
" -------------------------------
syn match csqTag "@'\([^']*\)'"

" -------------------------------
" Define members
" -------------------------------
syn match csqMember "[a-zA-Z_][a-zA-Z0-9_]*\.\zs[a-zA-Z_][a-zA-Z0-9_]*\ze"

" -------------------------------
" Define decorators
" -------------------------------
syn match csqDeco "#[^\S]\+"

" -------------------------------
" Define operators
" -------------------------------
syn match csqOperator ":="
syn match csqOperator "=="
syn match csqOperator ">="
syn match csqOperator "<="
syn match csqOperator "!="
syn match csqOperator "?"
syn match csqOperator "++"
syn match csqOperator "--"

" -------------------------------
" Define function-related things
" -------------------------------
syn match csqFunc /\<[a-zA-Z_][a-zA-Z0-9_]*\>\ze(.*)/
syn match csqArg /\<[a-zA-Z_][a-zA-Z0-9_]*\ze:\s*/

" -------------------------------
" Define delimeters
" -------------------------------
syn match csqDelim /[{}]/

" -------------------------------
" Define structure-related things
" -------------------------------
"syn match csqStructMember /@[a-zA-Z_][a-zA-Z0-9_]*/
syn match csqDestroy /\~[a-zA-Z_][a-zA-Z0-9_]*/

" -------------------------------
" Highlighting
" -------------------------------
hi def link csqKeyword Keyword
hi csqRefKeyword guifg=LightGreen
hi csqOperatorKeyword guifg=LightMagenta
hi def link csqType Type
hi def link csqComment Comment
hi def link csqNumber Number
hi def link csqString String
hi def link csqInterpolation SpecialChar
hi def link csqEscape SpecialChar
hi csqTag guifg=Yellow
hi def link csqBuiltin Constant
hi def link csqOperator Operator
hi def link csqFunc Function
hi csqDestroy guifg=Red
"hi def link csqStructMember Special
hi csqArg guifg=LightRed
hi csqDeco guifg=LightGreen
hi def link csqDelim Delimeter
hi csqMember guifg=SlateBlue

" Mark this buffer as using csq syntax
let b:current_syntax = "csq"


