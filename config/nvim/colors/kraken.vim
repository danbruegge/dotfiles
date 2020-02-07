" cool help screens
" + :he group-name
" + :he highlight-groups
" + :he cterm-colors
"
" colors: https://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html

" TODO:
" - better way to show []{}()..
" - visualize if text got yanked to clipboard
" - add lightline colors
" - make a package from it

let g:colors_name="kraken"

hi clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256
set background=dark

function! s:HL(group, fg, ...)
  " Arguments: group, ctermfg, ctermbg, cterm

  let group = "hi " . a:group
  let fg = " guifg=" . a:fg[0] . " ctermfg=" . a:fg[1]
  let bg = " guibg=" . get(a:, 1, s:none)[0] . " ctermbg=" . get(a:, 1, s:none)[1]
  let cterm = " gui=" . get(a:, 2, s:none)[0] . " cterm=" . get(a:, 2, s:none)[1]

  exec group . fg . bg . cterm
endfunction

let s:none = ["NONE", "NONE"]
let s:bold = ["bold", "bold"]
let s:italic = ["italic", "italic"]
let s:inverse = ["inverse", "inverse"]
let s:undercurl = ["undercurl", "undercurl"]

" COLORS
let s:shape1 = ["#121212", 233]
let s:shape2 = ["#1c1c1c", 234]
let s:shape3 = ["#303030", 236]
let s:shape4 = ["#444444", 238]
let s:shape5 = ["#949494", 246]
let s:shape6 = ["#a8a8a8", 248]
let s:shape7 = ["#bcbcbc", 250]
let s:shape8 = ["#d0d0d0", 252]
let s:primary = ["#5faf5f", 71]
let s:special = ["#af00d7", 128]
let s:fg = ["#eeeeee", 15]
let s:bg = s:shape2
let s:error = ["#ff005f", 197]
let s:warning = ["#ffaf5f ", 215]
let s:info = ["#87afff", 111] " maybe needs a diffrent color
let s:debug = ["#ff00d7", 200]

" LINKS
call s:HL("KrakenShape1", s:shape1)
call s:HL("KrakenShape2", s:shape2)
call s:HL("KrakenShape3", s:shape3)
call s:HL("KrakenShape4", s:shape4)
call s:HL("KrakenShape5", s:shape5)
call s:HL("KrakenShape6", s:shape6)
call s:HL("KrakenShape7", s:shape7)
call s:HL("KrakenShape8", s:shape8)
call s:HL("KrakenPrimary", s:primary)
call s:HL("KrakenSpecial", s:special)
call s:HL("KrakenFg", s:fg)
call s:HL("KrakenBg", s:bg)
call s:HL("KrakenError", s:error)
call s:HL("KrakenWarning", s:warning)
call s:HL("KrakenInfo", s:info)
call s:HL("KrakenDebug", s:debug)

" BASE
call s:HL("Normal", s:fg, s:bg)
call s:HL("Comment", s:shape5, s:none, s:italic)
call s:HL("Constant", s:primary)
call s:HL("Identifier", s:shape6)
call s:HL("Statement", s:shape6)
call s:HL("PreProc", s:fg)
call s:HL("Type", s:shape6)
call s:HL("Special", s:shape5) " TODO: need () and []
call s:HL("Underlined", s:fg)
call s:HL("Todo", s:shape6, s:none, s:bold)

" NAMES
call s:HL("CursorLine", s:none, s:shape1)
call s:HL("ColorColumn", s:none, s:shape1)
call s:HL("VertSplit", s:shape4, s:shape1)
call s:HL("SignColumn", s:none, s:bg)
call s:HL("LineNr", s:shape4)
call s:HL("CursorLineNr", s:shape4, s:none, s:bold)
call s:HL("Whitespace", s:fg)
call s:HL("NonText", s:shape4)
call s:HL("Folded", s:shape5, s:none, s:italic)

" search and selection
call s:HL("IncSearch", s:primary, s:shape3)
call s:HL("Substitute", s:primary, s:shape3)
call s:HL("Search", s:none, s:shape3)
call s:HL("Visual", s:none, s:shape3)

" popupmenu
call s:HL("Pmenu", s:shape7, s:shape1)
call s:HL("PmenuSel", s:primary, s:shape3)
call s:HL("PmenuSbar", s:none, s:shape1)
call s:HL("PmenuThumb", s:none, s:shape3)

" error/warning
call s:HL("Error", s:error)
call s:HL("ErrorMsg", s:error)
call s:HL("WarningMsg", s:warning)

" Plugins: {{{

" ALE
call s:HL('ALEError', s:error, s:none, s:undercurl)
call s:HL('ALEWarning', s:warning, s:none, s:undercurl)
call s:HL('ALEInfo', s:warning, s:none, s:undercurl)

" JSX
hi! link jsxTagName KrakenDebug
hi! link jsxComponentName KrakenShape6
hi! link jsxCloseString KrakenShape4
hi! link jsxAttrib KrakenFg
hi! link jsxEqual KrakenFg

" Signature
hi! link SignatureMarkText KrakenDebug
hi! link SignatureMarkerText KrakenDebug

" Signify
hi! link SignifySignAdd KrakenPrimary
hi! link SignifySignChange KrakenWarning
hi! link SignifySignDelete KrakenError

" Startify
hi! link StartifyBracket KrakenShape4
hi! link StartifyFile KrakenPrimary
hi! link StartifyNumber KrakenShape7
hi! link StartifyPath KrakenPrimary
hi! link StartifySlash KrakenShape6
hi! link StartifySection KrakenShape7
hi! link StartifySpecial KrakenPrimary
hi! link StartifyHeader KrakenShape5
hi! link StartifyFooter KrakenShape5

" vim-plug
hi! link plug1 KrakenShape5
hi! link plugUpdate KrakenShape7
hi! link plugName KrakenShape5
hi! link plugNumber KrakenFg
hi! link plugMessage KrakenPrimary

" }}}
