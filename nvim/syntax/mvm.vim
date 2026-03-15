" vim: syntax=MVM
" Simple syntax file for C squared language

" -------------------------------
" Define keywords
" -------------------------------
syn match MVMOP '\<[A-Z][A-Z]*\>'

" -------------------------------
" Define comments
" -------------------------------
" Single-line comments start with //
syn match MVMComment ";.*$"

" -------------------------------
" Define numbers
" -------------------------------
syn match MVMNumber "\<\d\+\>"
"syn match MVMNumber "0x[a-fA-F0-9]\+"
"syn match MVMNumber "0b[10]\+"

" -------------------------------
" Define characters
" -------------------------------
syn match MVMChar /'[^']'/

" -------------------------------
" Highlighting
" -------------------------------
hi def link MVMOP Keyword
hi def link MVMComment Comment
hi def link MVMNumber Number
hi def link MVMChar String

" Mark this buffer as using MVM syntax
let b:current_syntax = "MVM"


