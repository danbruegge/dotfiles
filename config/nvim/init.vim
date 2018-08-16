" vim:fdm=marker
"
" =============================================================================
" vim-plug {{{
" =============================================================================

call plug#begin('~/.config/nvim/bundle')

" dependencies?!
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'

" visuals
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'bounceme/poppy.vim'
Plug 'machakann/vim-highlightedyank'

" editor sugar
Plug 'w0rp/ale'
Plug 'vim-scripts/loremipsum'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx', 'typescript', 'typescript.jsx'] }
Plug 'SirVer/ultisnips'
Plug 'mhinz/vim-startify'
Plug 'mileszs/ack.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mhinz/vim-signify'

" languages
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript.jsx', 'typescript.jsx', 'css', 'scss'] }
Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'javascript.jsx', 'typescript.jsx'] }

" `for` css currently because i don't use abc files. This prevents me from
" deactivating the plugin so i can retrieve updates and checkout later.
Plug 'styled-components/vim-styled-components', { 'for': ['abc'] }

" TODO:
" Plug 'simnalamburt/vim-mundo' " https://github.com/simnalamburt/vim-mundo
" OR https://github.com/mbbill/undotree

call plug#end()

" }}}

" =============================================================================
" vim common {{{
" =============================================================================

    " filetype stuff
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
let g:gruvbox_contrast_light='soft'

let g:onedark_termcolors=256

colorscheme gruvbox

set completeopt=longest,menuone

    " Show partial commands in the last line of the screen
set showcmd

    " tabbing stuff
set expandtab
set shiftwidth=2
set softtabstop=2

    " indenting
set smartindent
set cindent

    " set relativenumber as default and switch if in insert mode to number
set number
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

    " set and display line ending
set ruler
set colorcolumn=80

    " a long line is just a long line
set nowrap

    " display/highlight current line
set cursorline

    " Set the command window height to 2 lines, to avoid many cases of having
    " to press <Enter> to continue"
set cmdheight=2

    " change options
set cpoptions+=$    " usefull when using `cw`. Adds a $ to the end of word

    " System default for mappings
let mapleader="\<Space>"
" let mapleader=","

    " Open the help window on the Vertical Left side
autocmd FileType help wincmd L
autocmd FileType h wincmd L

    " Removes the delay after hiting <esc><S-o>
    " https://github.com/vim/vim/issues/24
    " It is related to terminal only. In gVim all is fine.
set timeout timeoutlen=3000 ttimeoutlen=100

    " disable 'ex' mode call
map Q <NOP>

    " Show invisibles
set list
set listchars=tab:»-,trail:·,eol:¬

    " set :substitute flag g to on
set gdefault

    " will open a split window with all searches of document from :substitute
set inccommand=split

" }}}

" =============================================================================
" Working with split windows {{{
" =============================================================================

    " Open a new vertical split and switch over to it
" nnoremap <leader>w <C-w>v<C-w>l

    " Open a new empty vertical split and switch over to it
nnoremap <leader>n <c-w>n<c-w>L

    " Open a new empty horizontal split and switch to it
nnoremap <leader>N <c-w>n<c-w>J

    " Makes jumping between splited windows easier
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l

" }}}

" =============================================================================
" Simple key mappings, that are time saver {{{
" =============================================================================

" vmap ------------------------------------------------------------------------
    " copy to system clipboard
vmap <leader>y "+y

" nmap ------------------------------------------------------------------------
    " Add new line on current position with <CTRL><ENTER>
nmap <c-cr> i<cr><Esc>

nmap <leader>1 :w !wc -w<cr>

" reload current buffer
nmap <leader>e :e<cr>

nmap <leader><cr> <F9>

nmap [l :lprevious<cr>
nmap ]l :lnext<cr>

nmap <left> :bprevious<cr>
nmap <right> :bnext<cr>

nmap <leader>g :Goyo<cr>
nmap <leader>l :Limelight!!<cr>

" nnoremap --------------------------------------------------------------------
    " Save file
nnoremap <leader>w :w<cr>

    "  Open file
nnoremap <leader>o :Files<cr>

    " buffer stuff
nnoremap <leader>b :Buffers<cr>
nnoremap <c-c>c :bp\|bd #<cr>
nnoremap <c-c>a :%bd<cr>

" mixed -----------------------------------------------------------------------
" disable arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>

nnoremap <leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

    " Simple sort lines
vmap <leader>s :sort<cr>
nmap <leader>si vi{:sort<cr>

" }}}

" =============================================================================
" Spellchecking {{{
" =============================================================================

nmap <silent> <f5> :set spell!<cr>

    " set default spellchecking to DE
setlocal spelllang=de_de

" }}}

" =============================================================================
" Markdown settings {{{
" =============================================================================

let g:vim_markdown_folding_disabled=1
let g:vim_markdown_conceal = 0

map <leader>h1 VypVr=
map <leader>h2 VypVr-

" }}}

" =============================================================================
" Emmet settings {{{
" =============================================================================

    " enable all function in all mode.
let g:user_emmet_mode='a'

let g:user_emmet_settings = {
\  'typescript.jsx' : {
\      'extends' : 'jsx',
\  },
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\  'jsx': {
\    'attribute_name': {'class': 'className'},
\  },
\}

    " quick emmet workaround to have css completion in javascript
function! ToggleJsxCssFt()
    if &filetype == 'javascript.jsx'
        set filetype=scss
    else
        set filetype=javascript.jsx
    endif
endfunction

nnoremap <leader>T :call ToggleJsxCssFt()<cr>

" }}}

" =============================================================================
" ALE stuff {{{
" =============================================================================

let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
    \ 'javascript': ['flow', 'eslint'],
    \ 'javascript.jsx': ['flow', 'eslint', 'stylelint'],
    \ 'typescript': ['tsserver'],
    \ 'typescript.jsx': ['tsserver'],
\}
let g:ale_linter_aliases = {'jsx': 'css'}

let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \ 'javascript': ['prettier', 'eslint'],
    \ 'javascript.jsx': ['prettier', 'eslint'],
    \ 'json': ['prettier', 'eslint'],
    \ 'typescript': ['prettier', 'tslint'],
    \ 'typescript.jsx': ['prettier', 'tslint'],
    \ 'scss': ['prettier'],
\}

let g:ale_javascript_prettier_use_local_config = 1

let g:ale_echo_msg_format = '%linter% says %s'

" only for typescript
let g:ale_completion_enabled = 1
let g:ale_linters_ignore = {'typescript': ['tslint']}

" }}}

" =============================================================================
" Clean up html {{{
" =============================================================================

vmap <F7> :!tidy -q -i --show-errors 0<cr>

" }}}

" =============================================================================
" Lightline stuff {{{
" =============================================================================

set noshowmode

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'component': {
        \ 'readonly': '%{&readonly?"x":""}',
    \ },
    \ 'component_function': {
        \ 'filename': 'LightLineFilename'
    \ },
\ }

function! LightLineFilename()
  return expand('%')
endfunction

" }}}

" =============================================================================
" UltiSnip stuff {{{
" =============================================================================

let g:UltiSnipsExpandTrigger = "<tab>"
let g:ycm_key_list_select_completion = ['<Down>']

" }}}

" =============================================================================
" Deoplete stuff {{{
" =============================================================================

" Enable deoplete when InsertEnter.
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()

let g:python3_host_prog = '/usr/bin/python3'
let g:deoplete#auto_complete_start_length = 2

let g:deoplete#sources#ternjs#filetypes = [
  \ 'jsx',
  \ 'javascript',
  \ 'javascript.jsx',
  \ 'typescript',
  \ 'typescript.jsx',
\ ]

" }}}

" =============================================================================
" Ack/Ag/Ripgrep stuff {{{
" =============================================================================

if executable('rg')
    let g:ackprg = 'rg --vimgrep --no-heading'
endif

let g:ack_apply_qmappings = 1
let g:ack_qhandler = 'botright copen 25'
let g:ackhighlight = 1
let g:ack_autoclose = 1
let g:ack_autofold_results = 1

" search, but don't open the first result immediately
map <leader>a :Ack! ""<left>
map <leader>r :Rg!<cr>

" }}}

" =============================================================================
" Startify stuff {{{
" =============================================================================

let g:startify_relative_path = 1
let g:startify_change_to_dir = 0
" let g:startify_bookmarks = [ '/tmp', '/etc' ]

" }}}

" =============================================================================
" jsx stuff {{{
" =============================================================================

let g:jsx_ext_required = 0

" }}}

" =============================================================================
" css stuff {{{
" =============================================================================

augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

" }}}

" =============================================================================
" editorconfig {{{
" =============================================================================

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:EditorConfig_exec_path = 'editorconfig'
let g:EditorConfig_core_mode = 'external_command'

" }}}

" =============================================================================
" goyo {{{
" =============================================================================

let g:goyo_linenr = 1

" }}}

" =============================================================================
" fzf.vim {{{
" =============================================================================

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" }}}

" =============================================================================
" poppy {{{
" =============================================================================

au! cursormoved * call PoppyInit()

" }}}

" =============================================================================
" limelight {{{
" =============================================================================

let g:limelight_conceal_ctermfg = 240

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" }}}

" =============================================================================
" vim-commentary {{{
" =============================================================================

" autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}

" }}}

" =============================================================================
" typescript {{{
" =============================================================================

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.jsx

" }}}

" =============================================================================
" vim-gitgutter {{{
" =============================================================================

set updatetime=500

" }}}

" =============================================================================
" vim-signify {{{
" =============================================================================

let g:signify_vcs_list = [ 'git' ]

" }}}
