let s:configDir = stdpath('config')
let s:dataDir = stdpath('data')


" Begin Vim-Plug declarations
call plug#begin(s:dataDir . '/plugged')

" General plugins
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'simnalamburt/vim-mundo'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'

" Color schemes
Plug 'nanotech/jellybeans.vim'
Plug 'joshdick/onedark.vim'
Plug 'kaicataldo/material.vim'

" Filetypes
Plug 'udalov/kotlin-vim'
Plug 'sheerun/vim-polyglot'

" Vim icons. This should be last
Plug 'ryanoasis/vim-devicons'

call plug#end()


" General settings
syntax on
filetype plugin indent on
set number relativenumber
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab 
set backspace=indent,eol,start
set scrolloff=3
set linebreak
set wildmenu
set hidden
set splitright
set tabpagemax=50

" Status line settings
set ruler
set showcmd
set laststatus=1

" Folding settings
set foldmethod=syntax
set foldlevelstart=30

" Swap, backup, and undo file settings.
" We use `let` instead of `set` to set options so that we can use 
" `s:dataDir` as a variable and not string literal.
set swapfile
let &directory = s:dataDir . '/swap//' 
set backup
set writebackup
let &backupdir = s:dataDir . '/backup'
set undofile
let &undodir = s:dataDir . '/undo'

" search/replace settings
set incsearch
set ignorecase
set smartcase
set nohlsearch
nnoremap <silent> <C-n> :set nohlsearch!<CR>

" NERD Commenter settings
noremap <silent> <c-c> :call NERDComment('n', "toggle")<CR>

" NERDTree settings
let NERDTreeShowHidden=1
let NERDChristmasTree=1
let NERDTreeMinimalUI=1
let NERDTreeQuitOnOpen=1
let NERDTreeHijackNetrw=0
noremap <C-y> :NERDTreeToggle<CR>

" Mundo settings
noremap <C-e> :MundoToggle<CR>

" fzf settings
noremap <C-p> :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'fd'
let g:fzf_layout = { 'down': '35%' }
let g:fzf_action = { 'enter': 'tabedit' }

" ctrlp settings
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-t>'],
  \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
  \ }

" indentLine settings
let g:indentLine_char = '┆'

" Enable mouse, scroll one line at a time
if has('mouse')
  set mouse=a
endif
noremap <ScrollWheelUp> <C-Y>
noremap <ScrollWheelDown> <C-E>

" remap <C-s> to write the file (temporarily commented out because
" coc uses this mapping)
"noremap <C-s> :w<CR>
"inoremap <C-s> <C-o>:w<CR>

" remap <C-h> and <C-l> to switch tabs left and right
noremap <C-h> gT
noremap <C-l> gt

" remap <C-j> and <C-k> to move the buffer view up and down
noremap <C-j> <C-e>
noremap <C-k> <C-y>

" remap j and k to move the cursor by screen-lines instead of file-lines
noremap j gj
noremap k gk

" swap 0 and ^
noremap 0 ^
noremap ^ 0

" set color scheme
if &t_Co == 256
  colorscheme onedark "twilight256 molokai
endif
  
" From the sample vimrc file:
"
" When editing a file, always jump to the last known cursor position.
" Don't do it if we're editing a git commit message.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the  default
" position when opening a file.
autocmd BufReadPost *
    \ if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Turn off trailing whitespace highlighting for Go files
let g:go_highlight_trailing_whitespace_error=0

" load .ejs files as html
autocmd BufNewFile,BufRead *.ejs   set syntax=html

" Enable 24-bit color support (note: disable this if using Terminal.app
" or any other terminal that doesn't support 24-bit colors.)
if (has("termguicolors"))
  set termguicolors
endif


execute 'source ' . s:configDir . '/coc_init.vim'

" disable COC by default
let g:coc_start_at_startup = v:false
