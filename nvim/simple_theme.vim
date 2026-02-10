hi clear
syntax reset
let g:colors_name = "simple"
set background=dark
set t_Co=256

" Foreground = #00FF00
" Background = #222222
" Yellow = #FFFF44
" Red = #FF4444
" Green = #008800
" Blue = #7788FF
" Purple = #FF77FF
" Cyan = #00CCCC

" Base
hi Normal guifg=#00FF00 ctermbg=NONE guibg=#222222 gui=NONE

" Red / Error
hi DiffText guifg=#FF4444 guibg=NONE
hi ErrorMsg guifg=#FF4444 guibg=NONE
hi WarningMsg guifg=#FF4444 guibg=NONE
hi PreProc guifg=#FF4444 guibg=NONE
hi Exception guifg=#FF4444 guibg=NONE
hi Error guifg=#FF4444 guibg=NONE
hi DiffDelete guifg=#FF4444 guibg=NONE
hi GitGutterDelete guifg=#FF4444 guibg=NONE
hi GitGutterChangeDelete guifg=#FF4444 guibg=NONE
hi cssIdentifier guifg=#FF4444 guibg=NONE
hi cssImportant guifg=#FF4444 guibg=NONE
hi Type guifg=#FF4444 guibg=NONE
hi Identifier guifg=#FF4444 guibg=NONE

" Green
hi PMenuSel guifg=#008800 guibg=NONE
hi Constant guifg=#008800 guibg=NONE
hi Repeat guifg=#008800 guibg=NONE
hi DiffAdd guifg=#008800 guibg=NONE
hi GitGutterAdd guifg=#008800 guibg=NONE
hi cssIncludeKeyword guifg=#008800 guibg=NONE
hi String guifg=#008800 guibg=NONE

"
" Yellow
hi IncSearch guifg=#FFFF44 guibg=NONE
hi Title guifg=#FFFF44 guibg=NONE
hi PreCondit guifg=#FFFF44 guibg=NONE
hi Debug guifg=#FFFF44 guibg=NONE
hi SpecialChar guifg=#FFFF44 guibg=NONE
hi Conditional guifg=#FFFF44 guibg=NONE
hi Todo guifg=#FFFF44 guibg=NONE
hi Special guifg=#FFFF44 guibg=NONE
hi Label guifg=#FFFF44 guibg=NONE
hi Delimiter guifg=#FFFF44 guibg=NONE
hi Number guifg=#FFFF44 guibg=NONE
hi CursorLineNR guifg=#FFFF44 guibg=NONE
hi Define guifg=#FFFF44 guibg=NONE
hi MoreMsg guifg=#FFFF44 guibg=NONE
hi Tag guifg=#FFFF44 guibg=NONE
hi MatchParen guifg=#FFFF44 guibg=NONE
hi Macro guifg=#FFFF44 guibg=NONE
hi DiffChange guifg=#FFFF44 guibg=NONE
hi GitGutterChange guifg=#FFFF44 guibg=NONE
hi cssColor guifg=#FFFF44 guibg=NONE

" Blue
hi Function guifg=#7788FF guibg=NONE

" Purple
hi Directory guifg=#FF77FF guibg=NONE
hi markdownLinkText guifg=#FF77FF guibg=NONE
hi javaScriptBoolean guifg=#FF77FF guibg=NONE
hi Include guifg=#FF77FF guibg=NONE
hi Storage guifg=#FF77FF guibg=NONE
hi cssClassName guifg=#FF77FF guibg=NONE
hi cssClassNameDot guifg=#FF77FF guibg=NONE
hi Keyword guifg=#FF77FF guibg=NONE

" Cyan
hi Statement guifg=#00CCCC guibg=NONE
hi Operator guifg=#00CCCC guibg=NONE
hi cssAttr guifg=#00CCCC guibg=NONE

" UI Elements
hi Pmenu guifg=#00FF00 guibg=#333333
hi SignColumn guibg=#222222
hi Title guifg=#00FF00
hi LineNr guifg=#555555 guibg=#222222
hi NonText guifg=#FF77FF guibg=#222222
hi Comment guifg=#666666 gui=italic
hi SpecialComment guifg=#FF77FF gui=italic guibg=NONE
hi CursorLine guibg=#333333
hi TabLineFill gui=NONE guibg=#333333
hi TabLine guifg=#555555 guibg=#333333 gui=NONE
hi StatusLine gui=bold guibg=#333333 guifg=#00FF00
hi StatusLineNC gui=NONE guibg=#222222 guifg=#00FF00
hi Search guibg=#FF77FF guifg=#00FF00
hi VertSplit gui=NONE guifg=#333333 guibg=NONE
hi Visual gui=NONE guibg=#333333

