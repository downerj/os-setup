" Auto-detect syntax highlighting.
syntax on

" Add line numbers.
set number

" Add end-of-line characters.
"set list

" Enable/disable word wrapping.
"set nowrap
set wrap
set linebreak

" Configure tabs.
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

" Configure backspace.
set backspace=indent,eol,start

" Set the swap directory.
set directory=~/.vim/swapfiles//

" Open vertical splits to the right.
set splitright

" Automatically change the directory to the current file's folder.
"set autochdir
autocmd BufEnter * silent! lcd %:p:h

" Highlight regex searches.
set hlsearch

" Color scheme.
" elflord, industry, koehler, murphy, pablo, torte
colo elflord

" Set wild mode to menu (:e, :cd, :Ex, etc.).
set wildmenu
