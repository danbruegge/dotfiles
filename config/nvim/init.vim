" vim:fdm=marker

" # vim-plug ==================================================================
call plug#begin('~/.config/nvim/bundle')

" colorschemes
Plug 'https://git.barfooz.com/danbruegge/kraken.vim'
Plug 'axvr/photon.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'owickstrom/vim-colors-paramount'

" visuals
Plug 'bounceme/poppy.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'kshenoy/vim-signature'
Plug 'machakann/vim-highlightedyank'

" editor sugar
Plug 'AaronLasseigne/yank-code'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'simnalamburt/vim-mundo'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" languages
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" # coc.nvim - nvim specific settings =========================================
set updatetime=300

set shortmess+=c

set signcolumn=yes

" # commands ==================================================================
command! -nargs=0 Nvimrc :e ~/.config/nvim/init.vim

command! -nargs=0 Up :PlugUpgrade | PlugUpdate


" # split windows =============================================================
" Open vertical split and switch over to it
nnoremap <leader>n <c-w>n<c-w>L:Startify<cr>

" Open a horizontal split and switch to it
nnoremap <leader>N <c-w>s<c-w>J

" Makes jumping between splited windows easier
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l

" # mappings ==================================================================
" copy to system clipboard
vmap yc "+y

" small hack to highlight also the yanked code
xmap yC :YankCode<cr>:call highlightedyank#highlight#add('HighlightedyankRegion', getpos("'<"), getpos("'>"), 'V', 1000)<cr>

" count words in file
nmap <leader>1 :w !wc -w<cr>

nmap [l :lprevious<cr>
nmap ]l :lnext<cr>

nmap <leader><cr> :Commands<cr>
nmap <leader>G :Goyo<cr>
nmap <leader>L :Limelight!!<cr>
nmap <leader>H :HexokinaseToggle<cr>
nmap <leader>C :ContextToggle<cr>
nmap <leader>f :Lines<cr>
nmap <leader>F :BLines<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>B :GitMessenger<CR>
nmap <leader>sr :SignifyRefresh<CR>
" ripgrep - search, but don't open the first result immediately:
nmap <leader>r :Rg!<cr>

" quickly open TODO.md file from buffer, if exist.
nmap <leader><Tab> :buffer TODO.md<cr>

" Save file
nnoremap <leader>w :w<cr>

" Open file
nnoremap <leader>o :Files<cr>
" Open changed files from `git status`
nnoremap <leader>O :GFiles?<cr>

" buffer
nnoremap <c-c>c :bp\|bd #<cr>
nnoremap <c-c>a :%bd<cr>:Startify<cr>
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>
nnoremap <leader><leader> <c-^>

" search for visually selected text
vnoremap // y/<C-R>"<CR>

" disable arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" go hollow mode
let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_transparent = 0
    endif
endfunction
nnoremap <leader>h :call Toggle_transparent()<CR>

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
    \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
        \ 'filename': 'LightLineFilename'
    \ },
\ }

function! LightLineFilename()
  return expand('%')
endfunction

" # startify ==================================================================
let g:startify_relative_path = 1
let g:startify_change_to_dir = 0
let g:startify_fortune_use_unicode = 1
let g:startify_update_oldfiles = 1
let g:startify_use_env = 1

" # goyo ======================================================================
let g:goyo_width = 82
let g:goyo_linenr = 1

" # fzf.vim ===================================================================
  " TODO: How can i avoid searching in filename
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always -g="!yarn.lock" -g="!**/dist/*" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" # poppy =====================================================================
au! cursormoved * call PoppyInit()

" # limelight =================================================================
let g:limelight_conceal_ctermfg = 240

" # vim-signify ===============================================================
let g:signify_vcs_list = [ 'git' ]

" # vim-mundo =================================================================
nnoremap <f6> :MundoToggle<CR>

" # coc.nvim ==================================================================
let g:coc_global_extensions = [
  \ 'coc-emmet',
  \ 'coc-eslint',
  \ 'coc-highlight',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-stylelint',
  \ 'coc-tsserver'
\ ]

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
