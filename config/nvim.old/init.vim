" vim:fdm=marker

" # vim-plug ==================================================================
call plug#begin('~/.config/nvim/bundle')

" colorschemes
" Plug 'https://git.bruegge.dev/danbruegge/kraken.vim'
" enable for dev
Plug '~/workspace/kraken.vim'
" Plug 'axvr/photon.vim'
" Plug 'gruvbox-community/gruvbox'
" Plug 'owickstrom/vim-colors-paramount'
" Plug 'davidosomething/vim-colors-meh'
" Plug 'dracula/vim'

" visuals
Plug 'bounceme/poppy.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'kshenoy/vim-signature'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'ryanoasis/vim-devicons'

" editor sugar
Plug 'AaronLasseigne/yank-code'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'rhysd/git-messenger.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'kevinhwang91/rnvimr'
Plug 'mattn/emmet-vim'

" languages
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-test/vim-test'
Plug 'preservim/vimux' " to open tmux panes for vim-test

" ---
" Plug 'wellle/context.vim'
"   - Vim plugin that shows the context of the currently visible buffer contents
" Plug 'iamcco/markdown-preview.nvim'
"   - preview markdown on your browser with sync scroll and flexible configuration
" ---

call plug#end()

let g:plug_window = "enew"
let g:plug_pwindow = "vsplit new"

" # vim common ================================================================
" filetype
filetype on
filetype plugin on
filetype indent on

" hide a unsaved buffer, so you can open a new buffer with :e
set hidden

" don't update the display while executing macors
set lazyredraw

" When the page starts to scroll, keep the cursor 8 lines from the top and
" 8 lines from the bottom
set scrolloff=8

" Better command-line completion
set wildignore+=*.dll,*.o,*.pyc,*.pyo,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif
set wildignore+=*$py.class,*.class,*/*.dSYM/*,*.dylib,*.DAT,*.scssc
set wildignore+=*/node_modules/*

" When completing by tag, show the whole tag, not just the funtion name
set showfulltag

" move backup files to ~/.vim/sessions
set backupdir=~/.config/nvim/sessions
set dir=~/.config/nvim/sessions

set background=dark

" theme specific settings before enable it with `colorscheme gruvbox`
let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=1
let g:gruvbox_italicize_strings=1
let g:gruvbox_invert_selection=0
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'

" fix hightlighting missspelled words:
" https://github.com/morhetz/gruvbox/issues/175
let g:gruvbox_guisp_fallback = "fg"

" colorscheme gruvbox
colorscheme kraken

set completeopt=longest,menuone

" auto resize splits on window/terminal resize
autocmd VimResized * wincmd =

" Show partial commands in the last line of the screen
set showcmd

" tabbing
set expandtab
set shiftwidth=2
set softtabstop=2

" indenting
set smartindent
set cindent

" set relativenumber as default and switch if in insert mode to number
" https://jeffkreeftmeijer.com/vim-number/
set number
autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif

" set and display line ending
set ruler
set colorcolumn=80,100,120

" a long line is just a long line
set nowrap

" display/highlight current line
set cursorline

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue"
set cmdheight=2

" change options
" usefull when using `cw`. Adds a $ to the end of word
set cpoptions+=$

" System default for mappings
let mapleader="\<Space>"

" Open the help window on the Vertical Left side
autocmd FileType help wincmd L
autocmd FileType h wincmd L

" disable 'ex' mode call
map Q <NOP>

" Show invisibles
set list
set listchars=tab:»-,trail:·,eol:¬

" set :substitute flag g to on
set gdefault

" will open a split window with all searches of document from :substitute
set inccommand=split

set termguicolors

" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.config/nvim/undo

" highlight yanked text since NEOVIM 0.5.0
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
augroup END

set foldmethod=syntax
set foldlevel=99

" # coc.nvim - nvim specific settings =========================================
set updatetime=100

set shortmess+=c

set signcolumn=yes

" # commands ==================================================================
command! -nargs=0 Nvimrc :e ~/.config/nvim/init.vim

command! -nargs=0 Up :PlugUpgrade | PlugUpdate

command! -nargs=0 Json :%!jq .

" # split windows =============================================================
" Open vertical split and switch over to it
nmap <leader>n <c-w>n<c-w>L:Startify<cr>

" Open a horizontal split and switch to it
nmap <leader>N <c-w>s<c-w>J

" Makes jumping between splited windows easier
nmap <a-h> <c-w>h
nmap <a-j> <c-w>j
nmap <a-k> <c-w>k
nmap <a-l> <c-w>l

" # mappings ==================================================================
" copy to system clipboard
vmap yc "+y

" copy to from cusor to end of the line
" :h Y
map Y y$

" small hack to highlight also the yanked code
" xmap yC :YankCode<cr>:call highlightedyank#highlight#add('HighlightedyankRegion', getpos("'<"), getpos("'>"), 'V', 1000)<cr>
xmap yC :YankCode<cr>

" count words in file
nmap <leader>1 :w !wc -w<cr>

nmap [l :lprevious<cr>
nmap ]l :lnext<cr>

nmap <leader><cr> :Commands<cr>
nmap <leader><leader> <c-^>
nmap <leader>w :w<cr>
nmap <leader>o :Files<cr>
nmap <leader>O :GFiles?<cr>
nmap <leader>H :HexokinaseToggle<cr>
nmap <leader>f :Lines<cr>
nmap <leader>F :BLines<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>m :Marks<cr>
nmap <leader>g :Commits<cr>
nmap <leader>h :History<cr>
nmap <leader>h; :History:<cr>
nmap <leader>h/ :History/<cr>
nmap <leader>gg :Goyo<cr>
nmap <leader>ll :Limelight!!<cr>
nmap <leader>r :RG!<cr>
nmap <leader>R :%s/

" buffer
nmap <c-c>c :bp\|bd #<cr>
nmap <c-c>a :%bd<cr>:Startify<cr>
nmap <Tab> :bnext<cr>
nmap <S-Tab> :bprevious<cr>

" search for visually selected text
vmap // y/<C-R>"<CR>

" disable arrow keys
imap <Up> <NOP>
imap <Down> <NOP>
imap <Left> <NOP>
imap <Right> <NOP>
nmap <Up> <NOP>
nmap <Down> <NOP>
nmap <Left> <NOP>
nmap <Right> <NOP>

" simple sort lines
vmap <leader>s :sort<cr>
nmap <leader>si vi{:sort<cr>

" # spellchecking =============================================================
nmap <silent> <f5> :set spell!<cr>

" set default spellchecking to DE
setlocal spelllang=de_de

" # markdown ==================================================================
map <leader>mh1 VypVr=
map <leader>mh2 VypVr-

" # lightline =================================================================
set noshowmode

let g:lightline = {
    \ 'colorscheme': 'kraken',
    \ 'component': {
        \ 'readonly': '%{&readonly?"x":""}',
    \ },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], ['filetype', 'filename', 'readonly' ] ],
    \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'cocstatus', 'fileformat', 'fileencoding' ] ]
    \ },
    \ 'component_function': {
    \   'tagbar' : 'LightLineTagbar',
    \   'filename': 'LightLineFilename',
    \   'filetype': 'LightLineFiletype',
    \   'fileformat': 'LightLineFileformat',
    \   'readonly': 'LightLineReadonly',
    \   'cocstatus': 'coc#status',
    \ },
\ }

function! LightLineFilename()
  let modified = &modified ? ' +' : ''
  return expand('%f') . modified
endfunction

function! LightLineFiletype()
  return WebDevIconsGetFileTypeSymbol()
endfunction

function! LightLineFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightLineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return ""
    else
        return ""
    endif
endfunction

" # startify ==================================================================
let g:startify_relative_path = 1
let g:startify_change_to_dir = 0
let g:startify_fortune_use_unicode = 1
let g:startify_update_oldfiles = 1
let g:startify_use_env = 1

" # goyo ======================================================================
let g:goyo_width = 102

autocmd! User GoyoLeave nested set bg=dark | colo kraken

" # fzf.vim ===================================================================
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, 1)

let g:fzf_action = { 'alt-n':  'rightbelow vsplit' }

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

" # poppy =====================================================================
au! cursormoved * call PoppyInit()

" # limelight =================================================================
let g:limelight_conceal_ctermfg = 240

" # vim-signify ===============================================================
let g:signify_vcs_list = [ 'git' ]

" # vim-mundo =================================================================
nmap <f6> :MundoToggle<CR>

" # vim-messenger =============================================================
nmap <leader>B :GitMessenger<CR>
"
" # vim-hexokinase ============================================================
let g:Hexokinase_highlighters = ['backgroundfull']

" # vim-test ==================================================================
autocmd BufEnter ~/workspace/zalando/* let g:test#javascript#jest#executable = 'yarn test'

let test#strategy = "vimux"

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" # vimux =====================================================================
let g:VimuxRunnerType = "window"
" let g:VimuxRunnerName = "div"

" # jsx =======================================================================
let g:vim_jsx_pretty_highlight_close_tag = 1

" # rnvimr ====================================================================
let g:rnvimr_enable_ex = 1 " Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_picker = 1 " Make Ranger to be hidden after picking a file
let g:rnvimr_shadow_winblend = 25 " Add a shadow window, value is equal to 100 will disable shadow
highlight link RnvimrNormal CursorLine " Link CursorLine into RnvimrNormal highlight in the Floating window

" # emmet =====================================================================
imap <A-/> <Plug>(emmet-expand-abbr)

" # coc.nvim ==================================================================
let g:coc_global_extensions = [
  \ 'coc-eslint',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-tailwindcss',
  \ 'coc-tsserver',
\ ]

" \ 'coc-stylelintplus',
"  "stylelintplus.autoFixOnSave": true,
"  "stylelintplus.filetypes": [
"    "css",
"    "scss",
"    "less",
"    "javascriptreact",
"    "typescriptreact"
"  ],

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gD :<C-u>CocList diagnostics<cr>
nmap <leader>d :<C-u>CocList diagnostics<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gR <Plug>(coc-rename)

nmap <A-.> <Plug>(coc-codeaction)
nmap <leader>cr :CocRestart<CR>

nmap <leader>e :RnvimrToggle<CR>

" Use K to show documentation in preview window
nmap <A-,> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

imap <C-l> <Plug>(coc-snippets-expand)

imap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
