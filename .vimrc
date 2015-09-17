" vim:fdm=marker
"
" =============================================================================
" vim-plug {{{
" =============================================================================

call plug#begin('~/.vim/bundle')

function! BuildYCM(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.force
        !./install.sh
    endif
endfunction

" dependings?!
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'

" visuals
Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'

" editor sugar
Plug 'vim-scripts/loremipsum'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tmhedberg/matchit'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'SirVer/ultisnips'
Plug 'ryanoasis/vim-devicons'

" languages
" Plug 'lervag/vim-latex', { 'for': ['plaintex', 'latextoc', 'tex'] }
Plug 'plasticboy/vim-markdown', { 'for': 'mkd' }
Plug 'mattn/emmet-vim', { 'for': ['xhtml', 'html', 'htmldjango', 'jsp', 'css', 'less', 'scss', 'stylus'] }
Plug 'ap/vim-css-color', { 'for': ['css', 'less', 'scss'] }
Plug 'groenewege/vim-less', { 'for': 'less' }
" Plug 'jdonaldson/vaxe', { 'for': 'haxe' }
" Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'marijnh/tern_for_vim', { 'for': 'javascript' }
" Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

call plug#end()

" }}}

" =============================================================================
" vim common {{{
" =============================================================================

    " Set 'nocompatible' to ward off unexpected things that your distro might
    " have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

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

    " Keep some stuff in the history
set history=100

    " When the page starts to scroll, keep the cursor 8 lines from the top and
    " 8 lines from the bottom
set scrolloff=8

    " Better command-line completion
set wildmenu
set wildignore+=*.dll,*.o,*.pyc,*.pyo,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif
set wildignore+=*$py.class,*.class,*/*.dSYM/*,*.dylib,*.DAT,*.scssc
set wildignore+=*/node_modules/*

    " When completing by tag, show the whole tag, not just the funtion name
set showfulltag

set encoding=utf-8

    " move backup files to ~/.vim/sessions
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

set background=dark

    " set terminal colors
set t_Co=256

colorscheme gruvbox

set completeopt=longest,menuone

    " Show partial commands in the last line of the screen
set showcmd

    " Highlight searches (use <C-L> to temporarily turn off highlighting; see
    " the mapping of <C-L> below)
set hlsearch

    " show search matches on type
set incsearch

    " set the search scan to wrap lines
set wrapscan

    " tabbing stuff
set tabstop=8
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4

    " indenting
set autoindent
set smartindent
set cindent

    " line numbers
set number

    " relative to the current line
" set relativenumber

    " set and display line ending
set ruler
set textwidth=0     " prevent line break at the end of the line
set wrapmargin=0
set colorcolumn=80

    " Dont highlight lines after 2048 chracters
set synmaxcol=2048

    " a long line is just a long line
set nowrap

    " Automatically read a file that has changed on disk
set autoread

    " display/highlight current line
set cursorline

    " Always display the status line
set laststatus=2

    " Set the command window height to 2 lines, to avoid many cases of having
    " to press <Enter> to continue"
set cmdheight=2

    " change options
set cpoptions+=$    " usefull when using `cw`. Adds a $ to the end of word

    " the stuff at the end of a file, to tell vim some options. For example:
    "    # vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
set modeline

    " System default for mappings
let mapleader="\<Space>"
" let mapleader=","

    " Solve the snipmate issue?
set nopaste

    " Open the help window on the Vertical Left side
autocmd FileType help wincmd L
autocmd FileType h wincmd L

    " Removes the delay after hiting <esc><S-o>
    " https://github.com/vim/vim/issues/24
    " It is related to terminal only. In gVim all is fine.
set timeout timeoutlen=3000 ttimeoutlen=100

" }}}

" =============================================================================
" Working with split windows {{{
" =============================================================================

    " Open a new vertical split and switch over to it
" nnoremap <leader>w <C-w>v<C-w>l

    " Open a new empty vertical split and switch over to it
nnoremap <leader>n <C-w>n<C-w>L

    " Makes jumping between splited windows easier
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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

    " force filetype to html on keystroke...fix my snipmate problem in html
    " files with django/jinja stuff
nmap <leader>h :set ft=html<cr>

nmap <leader>1 :w !wc -w<cr>

" nnoremap -------------------------------------------------------------------
    " Save file
nnoremap <leader>w :w<cr>

    "  Open file
nnoremap <leader>o :CtrlP<cr>

    " Open buffer list
nnoremap <leader>b :CtrlPBuffer<cr>

    " disable arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

nnoremap <leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

nnoremap <c-c> :bp\|bd #<cr>

" }}}

" =============================================================================
" Spellchecking {{{
" =============================================================================

nmap <silent> <f5> :set spell!<cr>

set spelllang=en_us

" }}}

" =============================================================================
" Markdown settings {{{
" =============================================================================

let g:vim_markdown_folding_disabled=1

" }}}

" =============================================================================
" Emmet settings {{{
" =============================================================================

    " enable all function in all mode.
let g:user_emmet_mode='a'

" }}}

" =============================================================================
" Syntastic stuff {{{
" =============================================================================

nmap <F8> :SyntasticCheck<cr>

    " always put errors to the loc list (:lopen or :lclose)
let g:syntastic_always_populate_loc_list = 1

    " Dont check on save
" let g:syntastic_mode_map = { 'mode': 'passive' }

    " Standard checker for python
let g:syntastic_python_checkers=['flake8', 'python']

    " Standard checker for javascript
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_javascript_jslint_args='-c ~/.jshintrc'

    " Standard checker for typescript
let g:syntastic_typescript_checkers=['tslint']
let g:syntastic_typescript_tslint_args='-c ~/.tslint.json'

" }}}

" =============================================================================
" Clean up html {{{
" =============================================================================

vmap <F7> :!tidy -q -i --show-errors 0<cr>

" }}}

" =============================================================================
" Airline stuff {{{
" =============================================================================

let g:airline_theme = 'tomorrow'
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline#extensions#whitespace#checks = []
let g:airline#extensions#syntastic#enabled = 1
    " cut long branch names
let g:airline#extensions#branch#displayed_head_limit = 25

let g:airline#extensions#tabline#enabled = 1

" }}}

" =============================================================================
" UltiSnip stuff {{{
" =============================================================================

let g:UltiSnipsExpandTrigger = "<tab>"
let g:ycm_key_list_select_completion = ['<Down>']

" }}}

" =============================================================================
" Ctrlp stuff {{{
" =============================================================================

let g:ctrlp_working_path_mode = 0
let g:ctrlp_show_hidden = 1

" }}}
