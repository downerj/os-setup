" Auto-detect syntax highlighting
syntax on

" Add line numbers
set number

" Add end-of-line characters
"set list

" Enable/disable word wrapping
set nowrap
"set wrap
"set linebreak

" Configure tabs to 2 spaces
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
"let &showbreak='    '

" Allow backspacing across indents and line breaks
set backspace=indent,eol,start

" Set the swap directory
set directory=~/.vim/swapfiles//

" Open vertical splits to the right
set splitright

" Always show the status line
"set laststatus=2

" Add the full file path and modify flag to the status line
"set statusline+=%F\ %m

" Automatically change the directory to the current file's folder
"set autochdir
autocmd BufEnter * silent! lcd %:p:h

" Highlight searches
set hlsearch
"set nohlsearch

" Set the color scheme
" Examples: elflord, industry, koehler, murphy, pablo, torte
colorscheme default
set background=dark

" Set wild mode to menus (:e, :cd, :Ex, etc.)
set wildmenu

" Use pop-up menu for wildmode
set wildoptions+=pum

" Enable mouse support
set mouse=a

" Ctrl+Shift+Left and Ctrl+Shift+Right move between tabs
nnoremap <C-S-Left> :tabprevious<CR>
nnoremap <C-S-Right> :tabnext<CR>

" Alt+Left and Alt+Right reposition tabs
"nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
"nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Shift+Scroll scrolls horizontally
nnoremap <S-ScrollWheelUp> <ScrollWheelLeft>
nnoremap <S-ScrollWheelDown> <ScrollWheelRight>

" Terminal on bottom, 10 rows tall
"botright term ++rows=10

" Disable the visual bell/flash
set belloff=all

if !has('win32')
  source "~/.gvimrc"
endif

