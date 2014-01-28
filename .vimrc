" =============================================================================
" pathogen
" =============================================================================

filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" =============================================================================
" vim common
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

    " Better command-line completion
set wildmenu

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

    " change options
set cpoptions+=$    " usefull when using `cw`. Adds a $ to the end of word

    " less with css
autocmd BufNewFile,BufRead *.less       set ft=less.css

    " the stuff at the end of a file, to tell vim some options. For example:
    "    # vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
set modeline

" =============================================================================
" Markdown settings
" =============================================================================

    " Don't fold the first 2 levels
let g:vim_markdown_initial_foldlevel=2


" =============================================================================
" Emmet settings
" =============================================================================

    "enable all function in all mode.
let g:user_emmet_mode='a'
