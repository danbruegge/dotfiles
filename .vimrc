" vim:fdm=marker
"
" =============================================================================
" vundle {{{
" =============================================================================

set nocompatible
filetype off

    " set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    " "let path = '~/some/path/here'
    " "call vundle#rc(path)

    " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tomasr/molokai'
Plugin 'plasticboy/vim-markdown'
Plugin 'mattn/emmet-vim'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'vim-scripts/loremipsum'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'tmhedberg/matchit'
Plugin 'bling/vim-airline'
" Plugin 'zoeesilcock/vim-caniusa' " https://github.com/zoeesilcock/vim-caniuse

call vundle#end()

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

    " Allow the cursor to go in to 'invalid' places
"set virtualedit=all

    " Better command-line completion
set wildmenu

    " When completing by tag, show the whole tag, not just the funtion name
set showfulltag

    " utf-8 encoding
set enc=utf-8

    " move backup files to ~/.vim/sessions
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

    " set background style 
set background=dark

    " set terminal colors
set t_Co=256

    " set colorscheme
colorscheme molokai 

    " Enable Omni completion, smart autocompletion
set omnifunc=syntaxcomplete#Complete

    " :h completeopt
set completeopt=longest,menuone,preview

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

    " Set the status line the way derek wyatt likes it
"set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

    " Always display the status line
set laststatus=2

    " Set the command window height to 2 lines, to avoid many cases of having
    " to press <Enter> to continue"
set cmdheight=2

    " change options
set cpoptions+=$    " usefull when using `cw`. Adds a $ to the end of word

    " less with css
autocmd BufNewFile,BufRead *.less set filetype=less.css

    " the stuff at the end of a file, to tell vim some options. For example:
    "    # vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
set modeline

    " System default for mappings
let mapleader=","

    " Solve the snipmate issue?
set nopaste

" }}}

" =============================================================================
" Working with split windows {{{
" =============================================================================

    " Open a new vertical split and switch over to it
nnoremap <leader>w <C-w>v<C-w>l

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

    " Add alternative for <Esc> in insert mode
imap jk <Esc>

    " Add new line on current position with <CTRL><ENTER>
nmap <c-cr> i<cr><Esc>

    " Simple sort lines
vmap <leader>s :sort<cr>

    " force filetype to html on keystroke...fix my snipmate problem in html
    " files with django/jinja stuff
nmap <leader>h :set ft=html<cr>

    " copy to system clipboard
vmap <leader>c "+y

    " paste from system clipboard
imap <leader>v <C-r>*

    " disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" }}}

" =============================================================================
" Markdown settings {{{
" =============================================================================

    " Don't fold the first 2 levels
let g:vim_markdown_initial_foldlevel=2

" }}}

" =============================================================================
" Emmet settings {{{
" =============================================================================

    "enable all function in all mode.
let g:user_emmet_mode='a'

    " simpler key stroke for <c-y>,
imap <leader>e <c-y>,

" }}}

" =============================================================================
" Syntastic stuff {{{
" =============================================================================

nmap <F8> :SyntasticCheck<cr>

    " Dont check on save
let g:syntastic_mode_map = { 'mode': 'passive' }

    " Args for checkers
let g:syntastic_javascript_jslint_args='--config ~/.jshintrc'

    " Standard checker for python
let g:syntastic_python_checkers=['flake8']

    " Standard checker for javascript 
let g:syntastic_javascript_checkers=['jshint']

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
let g:airline_enable_syntastic  = 1
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline#extensions#whitespace#checks = []

" }}}
