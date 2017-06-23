"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'flazz/vim-colorschemes'
Plugin 'crusoexia/vim-monokai'

Plugin 'jelera/vim-javascript-syntax'

Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'mattn/emmet-vim'

Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on

" Vim, before you think about using a buffer
set directory=$HOME/.vim/swapfiles//
set statusline=%f
set showcmd                     " (sc) show last command, turn off if terminal slow, ha!
set hidden                      " (hid) allows switching buffers without saving changes first
set wildmenu                    " (wmnu) visual menu for cmd autocomplete
set lazyredraw                  " don't redraw screen unless you have to, to speed up macros
set scrolloff=3                 " leave some context on the screen
set relativenumber              " check abs in the status if you need it
set undofile                    " persistent undo history

set number                      " (nu) display line numbers
set nowrap                      " do not wrap lines (wrapping messes with my visualization of indentation)
"set cursorline                  " (cul) highlight current line
set linebreak                   " (lbr) wrap long lines at a space instead of in the middle of a word
set listchars+=tab:>-           " (lcs) strings used in 'list' mode to show hidden characters (default=eol:$)
set listchars+=trail:-

"colorscheme monokai-chris
colorscheme monokai
set background=dark

" working with buffers
set foldcolumn=8                " (fdc) width of fold column (to see where folds are)
set foldmethod=indent           " (fdm) creates a fold for every level of indentation
set foldlevel=99                " (fdl) when file is opened, don't close any folds
set foldenable                  " (fen) enables or disables folding
"set foldclose=all

set showmatch                   " (sm) briefly jump to matching bracket when inserting one
set autoindent                  " (ai) turn on auto-indenting (great for programers)
set copyindent                  " (ci) when auto-indenting, use the indenting format of the previous line
set smartindent                 " (si) auto-indent new lines, well?!
set tabstop=4                   " (ts) width (in spaces) that a <tab> is displayed as
set shiftwidth=4                " (sw) width (in spaces) used in each step of autoindent (aswell as << and >>)
"set expandtab                  " (et) expand tab key to appropriate number of spaces

set wrapscan                    " (ws) allows search to wrap to top of document when the bottom has been hit
set incsearch                   " (is) highlights what you are searching for as you type
set hlsearch                    " (hls) highlights all instances of the last searched string
set ignorecase                  " (ic) ignores case in search patterns
set smartcase                   " (scs) don't ignore case when the search pattern has uppercase
set infercase                   " (inf) during keyword completion, fix case of new word (when ignore case is on)
set gdefault                    " replace globally and add /g to toggle behavior


" match html tags (emmet I think)
"let g:mta_filetypes = {
    "\ 'html' : 1,
    "\ 'xhtml' : 1,
    "\ 'xml' : 1,
    "\ 'jinja' : 1,
    "\ 'php' : 1,
    "\ }




" Key Mappings
" --------------------------------------------

" namespaced key for user commands
let mapleader = ","

" escape insert mode
inoremap jk <Esc>

inoremap eev :vsplit $MYVIMRC<cr>

" allows moving between horizonatlly split windows much faster and more intuitive (meh, I'll try it), maximizes the window height
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" <F7> toggles hidden characters
map  <F7> :set list!<CR>
imap <F7> <ESC>:set list!<CR>a

" <F8> toggles paste
map  <F8> :set paste!<CR>
imap <F8> <ESC>:set paste!<CR>a

" <F9> toggles word wrap
map  <F9> :set wrap!<CR>
imap <F9> <ESC>:set wrap!<CR>a

" clear annoying search highlight
nnoremap <leader><space> :noh<cr>

" quicker saves, etc.
"nnoremap ; :

" fix background paint issue, quickly
nnoremap bdbd :set background=dark<CR>

" Auto commands

" save on focus change, why not?
au FocusLost * :wa

" remember last position
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" quick fold tag, good for HTML
nnoremap <leader>ft Vatzf

" underline a comment heading with equals
nnoremap <leader>1 yypVr=
