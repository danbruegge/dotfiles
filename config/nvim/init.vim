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
Plug 'nowk/genericdc'
Plug 'itchyny/lightline.vim'

" editor sugar
Plug 'benekastah/neomake'
Plug 'vim-scripts/loremipsum'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tmhedberg/matchit'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
Plug 'ryanoasis/vim-devicons' " devicons needs this package: `nerd-fonts-git`
Plug 'mhinz/vim-startify'
Plug 'mileszs/ack.vim'
Plug 'jremmen/vim-ripgrep'

" languages
Plug 'plasticboy/vim-markdown', { 'for': ['mkd', 'markdown'] }
Plug 'mattn/emmet-vim', { 'for': ['xhtml', 'html', 'htmldjango', 'pug', 'jsp', 'css', 'less', 'scss', 'stylus'] }
Plug 'ap/vim-css-color', { 'for': ['css', 'less', 'scss', 'stylus'] }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }
Plug 'marijnh/tern_for_vim', { 'for': ['javascript', 'jsx'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx'] }

" TODO:
" Plug 'simnalamburt/vim-mundo' " https://github.com/simnalamburt/vim-mundo

call plug#end()

" }}}

" =============================================================================
" vim common {{{
" =============================================================================

    " filetype stuff
filetype on
filetype plugin on
filetype indent on

    " syntax highlighting for vim
syntax on

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
"set termguicolors
let g:gruvbox_italic=1
let g:gruvbox_invert_selection=0
let g:gruvbox_contrast_dark='hard'

colorscheme gruvbox

set completeopt=longest,menuone

    " Show partial commands in the last line of the screen
set showcmd

    " tabbing stuff
set expandtab
set shiftwidth=4
set softtabstop=4

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

    " always look for file changes
set autoread

    " need for vaxe and autocomplete
set autowrite

    " disable 'ex' mode call
map Q <NOP>

" }}}

" =============================================================================
" Working with split windows {{{
" =============================================================================

    " Open a new vertical split and switch over to it
" nnoremap <leader>w <C-w>v<C-w>l

    " Open a new empty vertical split and switch over to it
nnoremap <leader>n <c-w>n<c-w>L

    " Makes jumping between splited windows easier
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l

" }}}

" =============================================================================
" Simple key mappings, that are time saver {{{
" =============================================================================

" vmap -----------------------------------------------------------------------
    " Simple sort lines
vmap <leader>s :sort<cr>

    " copy to system clipboard
vmap <leader>y "+y

" nmap -----------------------------------------------------------------------
    " Add new line on current position with <CTRL><ENTER>
nmap <c-cr> i<cr><Esc>

nmap <leader>1 :w !wc -w<cr>

nmap <leader><cr> <F9>

nmap [l :lprevious<cr>
nmap ]l :lnext<cr>

nmap <left> :bprevious<cr>
nmap <right> :bnext<cr>

" nnoremap -------------------------------------------------------------------
    " Save file
nnoremap <leader>w :w<cr>

    "  Open file
nnoremap <leader>o :FZF<cr>

    " disable arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>

nnoremap <leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

" buffer stuff
nnoremap <leader>b :ls<cr>:b<space>
nnoremap <c-c>c :bp\|bd #<cr>
nnoremap <c-c>a :%bd<cr>

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

map <leader>h1 VypVr=
map <leader>h2 VypVr-

" }}}

" =============================================================================
" Emmet settings {{{
" =============================================================================

    " enable all function in all mode.
let g:user_emmet_mode='a'

" }}}

" =============================================================================
" Neomake stuff {{{
" =============================================================================

autocmd! BufWritePost * Neomake

    " Standard maker for javascript
let g:neomake_javascript_enabled_makers = ['eslint']

" }}}

" =============================================================================
" Clean up html {{{
" =============================================================================

vmap <F7> :!tidy -q -i --show-errors 0<cr>

" }}}

" =============================================================================
" Lightline stuff {{{
" =============================================================================

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'component': {
    \   'readonly': '%{&readonly?"⭤":""}',
    \ },
    \ 'component_function': {
    \   'filetype': 'MyFiletype',
    \   'fileformat': 'MyFileformat',
    \ }
\ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" }}}

" =============================================================================
" UltiSnip stuff {{{
" =============================================================================

let g:UltiSnipsExpandTrigger = "<tab>"
let g:ycm_key_list_select_completion = ['<Down>']

" }}}

" =============================================================================
" vaxe stuff {{{
" =============================================================================

let g:vaxe_cache_server = 1
let g:vaxe_lime_target = "linux -neko -64"

" }}}

" =============================================================================
" Deoplete stuff {{{
" =============================================================================

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1


" }}}

" =============================================================================
" Ack/Ag/Ripgrep stuff {{{
" =============================================================================

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

let g:ack_apply_qmappings = 1
let g:ack_qhandler = 'botright copen 25'
let g:ackhighlight = 1
let g:ack_autoclose = 1
let g:ack_autofold_results = 1

" search, but don't open the first result immediately
map <leader>fs :Rg ""<left>

" }}}

" =============================================================================
" Startify stuff {{{
" =============================================================================

let g:startify_change_to_dir = 0

" }}}

" =============================================================================
" jsx stuff {{{
" =============================================================================

let g:jsx_ext_required = 0

" }}}
