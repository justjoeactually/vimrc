"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" to setup your local env run these 4 commands (not tested yet :p)
" $ echo 'runtime vimrc' ~/.vimrc
" $ git clone https://github.com/justjoeactually/vimrc.git ~/.vim
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" $ mkdir ~/.vim/swapfiles
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'flazz/vim-colorschemes'
Plugin 'crusoexia/vim-monokai'

" Javascript linting etc. and I could never get it to work :'(
" ============================================================
"Plugin 'jelera/vim-javascript-syntax'
"Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'vim-syntastic/syntastic'
" end js

Plugin 'mattn/emmet-vim'

Plugin 'tpope/vim-surround'

Plugin 'scrooloose/nerdtree'

" Vue syntax
" Plugin 'posva/vim-vue'

" standarized settings
Plugin 'editorconfig/editorconfig-vim'

" fuzzy file search
Plugin 'kien/ctrlp.vim'

" comment command is 'gc'
Plugin 'tomtom/tcomment_vim'

" Laravel blade syntax
Plugin 'jwalton512/vim-blade'

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

" set syntastic options
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exe = 'npm run lint --'

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
set undodir=$HOME/.vim/undo     " where to save undo histories

set number                      " (nu) display line numbers
set nowrap                      " do not wrap lines (wrapping messes with my visualization of indentation)
"set cursorline                  " (cul) highlight current line
set linebreak                   " (lbr) wrap long lines at a space instead of in the middle of a word
set listchars+=tab:>-           " (lcs) strings used in 'list' mode to show hidden characters (default=eol:$)
set listchars+=trail:-
set backspace=indent,eol,start

"colorscheme monokai-chris
colorscheme monokai
"colorscheme vividchalk

" working with buffers
set foldcolumn=4                " (fdc) width of fold column (to see where folds are)
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


" Key Mappings
" --------------------------------------------

" namespaced key for user commands
let mapleader = ","

" CtrlP default mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

" setup ag and the silver searcher for find and replace in dir -r (also run
" >brew install the_silver_surfer
" let g:ackprg = 'ag --nogroup --nocolor --column'

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

" make and load sessions with <F2> and <F3>
map <F2> :mksession! ~/vim_session <cr>
map <F3> :source ~/vim_session <cr>

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
nnoremap <leader>bd :set background=dark<CR>

" toggle nerdTree
nnoremap <Leader>f :NERDTreeToggle<Enter>

" open nerdTree for current file
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" Auto commands
" =============

" open nerdtree when opening vim
au StdinReadPre * let s:std_in=1
au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close nerdtree if last window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" save on focus change, why not?
au FocusLost * :wa

" remember last position
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" set indentation for js, css, html
au Filetype javascript setlocal ts=2 sw=2 smartindent
au Filetype html setlocal ts=2 sw=2 smartindent
au Filetype css setlocal ts=2 sw=2 smartindent

" strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" quick fold tag, good for HTML
nnoremap <leader>ft Vatzf

" underline a comment heading with equals
nnoremap <leader>1 yypVr=
