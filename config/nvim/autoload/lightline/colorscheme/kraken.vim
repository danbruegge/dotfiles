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

  let s:shape1 = s:getKrakenColor('KrakenShape1')
  let s:shape2 = s:getKrakenColor('KrakenShape2')
  let s:shape3 = s:getKrakenColor('KrakenShape3')
  let s:shape4 = s:getKrakenColor('KrakenShape4')
  let s:shape5 = s:getKrakenColor('KrakenShape5')
  let s:shape6 = s:getKrakenColor('KrakenShape6')
  let s:shape7 = s:getKrakenColor('KrakenShape7')
  let s:shape8 = s:getKrakenColor('KrakenShape8')
  let s:primary = s:getKrakenColor('KrakenPrimary')
  let s:special = s:getKrakenColor('KrakenSpecial')
  let s:fg = s:getKrakenColor('KrakenFg')
  let s:bg = s:getKrakenColor('KrakenBg')
  let s:error = s:getKrakenColor('KrakenError')
  let s:warning = s:getKrakenColor('KrakenWarning')
  let s:info = s:getKrakenColor('KrakenInfo')
  let s:debug = s:getKrakenColor('KrakenDebug')
  let s:insert = s:getKrakenColor('KrakenInsert')
  let s:visual = s:getKrakenColor('KrakenVisual')
  let s:replace = s:getKrakenColor('KrakenReplace')

  let s:p = {'normal':{}, 'inactive':{}, 'insert':{}, 'replace':{}, 'visual':{}, 'tabline':{}, 'terminal':{}}

  let s:p.normal.left = [ [ s:primary, s:shape3 ], [ s:shape5, s:shape2 ] ]
  let s:p.normal.middle = [ [ s:shape5, s:shape1 ] ]
  let s:p.normal.right = [ [ s:primary, s:shape3 ], [ s:shape5, s:shape2 ] ]
  let s:p.normal.error = [ [ s:error, s:shape3 ] ]
  let s:p.normal.warning = [ [ s:warning, s:shape3 ] ]

  let s:p.inactive.left = [ [ s:shape5, s:shape3 ], [ s:shape5, s:shape2 ] ]
  let s:p.inactive.middle = [ [ s:shape5, s:shape1 ] ]
  let s:p.inactive.right = [ [ s:shape5, s:shape3 ], [ s:shape5, s:shape2 ] ]

  let s:p.insert.left = [ [ s:insert, s:shape3 ], [ s:shape5, s:shape2 ] ]
  let s:p.insert.middle = [ [ s:shape5, s:shape1 ] ]
  let s:p.insert.right = [ [ s:insert, s:shape3 ], [ s:shape5, s:shape2 ] ]

  let s:p.visual.left = [ [ s:visual, s:shape3 ], [ s:shape5, s:shape2 ] ]
  let s:p.visual.middle = [ [ s:shape5, s:shape1 ] ]
  let s:p.visual.right = [ [ s:visual, s:shape3 ], [ s:shape5, s:shape2 ] ]

  let s:p.tabline.left = [ [ s:primary, s:shape3 ] ]
  let s:p.tabline.tabsel = [ [ s:primary, s:shape1 ] ]
  let s:p.tabline.middle = [ [ s:shape5, s:shape1 ] ]
  let s:p.tabline.right = [ [ s:primary, s:shape2 ] ]

  let s:p.replace.left = [ [ s:replace, s:shape3 ], [ s:shape5, s:shape2 ] ]
  let s:p.replace.middle = [ [ s:shape5, s:shape1 ] ]
  let s:p.replace.right = [ [ s:replace, s:shape3 ], [ s:shape5, s:shape2 ] ]

  let s:p.terminal.left = [ [ s:info, s:shape3 ], [ s:shape5, s:shape2 ] ]
  let s:p.terminal.middle = [ [ s:shape5, s:shape1 ] ]
  let s:p.terminal.right = [ [ s:info, s:shape3 ], [ s:shape5, s:shape2 ] ]

  let g:lightline#colorscheme#kraken#palette = lightline#colorscheme#flatten(s:p)

endif
