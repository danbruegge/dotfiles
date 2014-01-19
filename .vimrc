" =============================================================================
" pathogen
" =============================================================================

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()


" =============================================================================
" vim common
" =============================================================================
	
    " Set 'nocompatible' to ward off unexpected things that your distro might
    " have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
	
    " utf-8 encoding
set enc=utf-8

    " move backup files to ~/.vim/sessions
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

    " set background style 
set background=dark

    " syntax highlighting for vim
syntax on

    " set terminal colors
set t_Co=256

    " set colorscheme
colorscheme molokai 

    " Attempt to determine the type of a file based on its name and possibly
    " its contents. Use this to allow intelligent auto-indenting for each 
    " filetype, and for plugins that are filetype specific.
filetype plugin indent on

    " Look at: ':h filetype-plugin'
filetype plugin on

    " Enable Omni completion, smart autocompletion
set omnifunc=syntaxcomplete#Complete

    " Better command-line completion
set wildmenu

    " Show partial commands in the last line of the screen
set showcmd

    " Highlight searches (use <C-L> to temporarily turn off highlighting; see 
    " the mapping of <C-L> below)
set hlsearch

    " show search matches on type
set incsearch

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
set textwidth=0     " prevent line break at the end of the line
set wrapmargin=0
set colorcolumn=80

    " a long line is just a long line
set nowrap

    " display/highlight current line
set cursorline

    " Always display the status line
set statusline=2

    " Set the command window height to 2 lines, to avoid many cases of having
    " to press <Enter> to continue"
set cmdheight=2

" =============================================================================
" Markdown settings
" =============================================================================

    " Don't fold the first 2 levels
let g:vim_markdown_initial_foldlevel=2

" =============================================================================
" Tab settings
" =============================================================================

    " Show tabline with number 2
set showtabline=2

" =============================================================================
" Emmet settings
" =============================================================================

    "enable all function in all mode.
let g:user_emmet_mode='a'
