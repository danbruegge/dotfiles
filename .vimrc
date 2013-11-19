" utf-8 encoding
set enc=utf-8

" syntax highlightning
filetype plugin on
syntax on
set t_Co=256
hi Normal ctermfg=white ctermbg=black

if has('gui_running')
    set background=light
else
    set background=dark
endif

" other stuff
set tabstop=4
set smarttab
set shiftwidth=4
set expandtab
set autoindent
set textwidth=79
set colorcolumn=+1
set ruler
set mouse=a
set cursorline
set scrolloff=5
set laststatus=2
set showcmd
set number

" search
set hlsearch
set incsearch
set wrapscan

" move backup files to ~/.vim/sessions
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

" enable hidden buffers
set hidden

