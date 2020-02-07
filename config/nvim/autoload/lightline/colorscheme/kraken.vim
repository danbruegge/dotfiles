" =============================================================================
" Filename: autoload/lightline/kraken.vim
" Author: danbruegge
" License: MIT License
" =============================================================================

function! s:getKrakenColor(group)
  let guiColor = synIDattr(hlID(a:group), "fg", "gui")
  let termColor = synIDattr(hlID(a:group), "fg", "cterm")
  return [ guiColor, termColor ]
endfunction

if exists('g:lightline')

  " let s:shape1 = s:getKrakenColor('KrakenShape1')
  " let s:shape2 = s:getKrakenColor('KrakenShape2')
  " let s:shape3 = s:getKrakenColor('KrakenShape3')
  " let s:shape4 = s:getKrakenColor('KrakenShape4')
  " let s:shape5 = s:getKrakenColor('KrakenShape5')
  " let s:shape6 = s:getKrakenColor('KrakenShape6')
  " let s:shape7 = s:getKrakenColor('KrakenShape7')
  " let s:shape8 = s:getKrakenColor('KrakenShape8')
  " let s:primary = s:getKrakenColor('KrakenPrimary')
  " let s:special = s:getKrakenColor('KrakenSpecial')
  " let s:fg = s:getKrakenColor('KrakenFg')
  " let s:bg = s:getKrakenColor('KrakenBg')
  " let s:error = s:getKrakenColor('KrakenError')
  " let s:warning = s:getKrakenColor('KrakenWarning')
  " let s:info = s:getKrakenColor('KrakenInfo')
  " let s:debug = s:getKrakenColor('KrakenDebug')

  let s:p = {'normal':{}, 'inactive':{}, 'insert':{}, 'replace':{}, 'visual':{}, 'tabline':{}, 'terminal':{}}
  let s:p.normal.left = [ [ s:shape1, s:primary, 'bold' ], [ s:fg, s:bg ] ]
  " let s:p.normal.right = [ [ s:bg0, s:fg4 ], [ s:fg4, s:bg2 ] ]
  " let s:p.normal.middle = [ [ s:fg4, s:bg1 ] ]
  " let s:p.inactive.right = [ [ s:bg4, s:bg1 ], [ s:bg4, s:bg1 ] ]
  " let s:p.inactive.left =  [ [ s:bg4, s:bg1 ], [ s:bg4, s:bg1 ] ]
  " let s:p.inactive.middle = [ [ s:bg4, s:bg1 ] ]
  " let s:p.insert.left = [ [ s:bg0, s:blue, 'bold' ], [ s:fg1, s:bg2 ] ]
  " let s:p.insert.right = [ [ s:bg0, s:blue ], [ s:fg1, s:bg2 ] ]
  " let s:p.insert.middle = [ [ s:fg4, s:bg1 ] ]
  " let s:p.terminal.left = [ [ s:bg0, s:green, 'bold' ], [ s:fg1, s:bg2 ] ]
  " let s:p.terminal.right = [ [ s:bg0, s:green ], [ s:fg1, s:bg2 ] ]
  " let s:p.terminal.middle = [ [ s:fg4, s:bg1 ] ]
  " let s:p.replace.left = [ [ s:bg0, s:aqua, 'bold' ], [ s:fg1, s:bg2 ] ]
  " let s:p.replace.right = [ [ s:bg0, s:aqua ], [ s:fg1, s:bg2 ] ]
  " let s:p.replace.middle = [ [ s:fg4, s:bg1 ] ]
  " let s:p.visual.left = [ [ s:bg0, s:orange, 'bold' ], [ s:bg0, s:bg4 ] ]
  " let s:p.visual.right = [ [ s:bg0, s:orange ], [ s:bg0, s:bg4 ] ]
  " let s:p.visual.middle = [ [ s:fg4, s:bg1 ] ]
  " let s:p.tabline.left = [ [ s:fg4, s:bg2 ] ]
  " let s:p.tabline.tabsel = [ [ s:bg0, s:fg4 ] ]
  " let s:p.tabline.middle = [ [ s:bg0, s:bg4 ] ]
  " let s:p.tabline.right = [ [ s:bg0, s:orange ] ]
  " let s:p.normal.error = [ [ s:bg0, s:orange ] ]
  " let s:p.normal.warning = [ [ s:bg2, s:yellow ] ]

  let g:lightline#colorscheme#kraken#palette = lightline#colorscheme#flatten(s:p)
  " let g:lightline#colorscheme#kraken#palette = lightline#colorscheme#flatten(s:p)
  " let g:lightline#colorscheme#kraken#palette = lightline#colorscheme#fill(s:p)
endif
