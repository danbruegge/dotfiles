" ---
" vim common
" ---

	" utf-8 encoding
set enc=utf-8

    " mave backup files to ~/.vim/sessions
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

    " set background for gui and xterm
if has('gui_running')
    set background=light
else
    set background=dark
endif

	" no transparent background on xterm
hi Normal ctermfg=white ctermbg=black

    " syntax highlighting for vim
syntax on

	" colorscheme, solarized
colorscheme solarized

	" set filetype plugin on
filetype plugin on

    " set indenting for files
filetype plugin indent on

   " auto indenting
set autoindent

    " line numbers
set number 

    " tabbing stuff
set tabstop=4
set smarttab
set shiftwidth=4

    " set and display line ending
set ruler
set textwidth=79
set colorcolumn=+1

	" display/highlight current line
set cursorline


" ---
" pathogen
" ---

execute pathogen#infect()
