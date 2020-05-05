" Enable syntax and plugins
syntax on
filetype plugin indent on

" Disable vi compatibility
set nocompatible 

" Show line number on the left
set number

" Expand tabs to 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4

" Better background and autocomplete window
set background=light

" Support UTF8
set encoding=UTF8

" Status bar
set laststatus=2                                        " Enable status bar
hi StatusLine ctermfg=0 ctermbg=6 cterm=None            " Active window colors
hi StatuslineTerm ctermfg=255 ctermbg=1 cterm=Bold      " Active window colors if it's a terminal
hi StatusLineNC ctermfg=255 ctermbg=8 cterm=NONE        " Non-active windows colors 
hi StatuslineTermNC ctermfg=0 ctermbg=3 cterm=NONE      " Non-Active window colors if it's a terminal

" Vertical split line
set fillchars=vert:\                                    " change spli charcter to space
hi VertSplit ctermfg=None ctermbg=8 cterm=Bold          " vertical splitting line colors

" vim's default file explorer ==> open with (Vexplorer .)
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

" vim's default shell
set shell=zsh

" Mouse support
" set mouse=a

