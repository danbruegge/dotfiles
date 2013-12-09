" =============================================================================
" pathogen
" =============================================================================

execute pathogen#infect()


" =============================================================================
" vim common
" =============================================================================
	
    " Set 'nocompatible' to ward off unexpected things that your distro might
    " have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
	
    " utf-8 encoding
set enc=utf-8

    " mave backup files to ~/.vim/sessions
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

    " set background style 
set background=dark

    " syntax highlighting for vim
syntax on

	" set terminal colors
set t_Co=256

    " colorscheme, solarized
if has('gui_running')
	colorscheme solarized
endif

    " Attempt to determine the type of a file based on its name and possibly
    " its contents. Use this to allow intelligent auto-indenting for each 
    " filetype, and for plugins that are filetype specific.
filetype plugin indent on

    " Better command-line completion
set wildmenu

    " Show partial commands in the last line of the screen
set showcmd

    " Highlight searches (use <C-L> to temporarily turn off highlighting; see 
    " the mapping of <C-L> below)
set hlsearch

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

    " set and display line ending
set ruler
set textwidth=79
set colorcolumn=+1

    " display/highlight current line
set cursorline

    " Always display the status line
set statusline=2

    " Set the command window height to 2 lines, to avoid many cases of having
    " to press <Enter> to continue"
set cmdheight=2

