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

" Mouse support
set mouse=a

" Default encoding
set encoding=UTF-8

" Hide extra colors of the most left column (git/syntax column) -  must be placed outside VimPlug
highlight clear SignColumn

" Allow switching buffers without saving
set hidden

" Toggle a terminal at the bottom of the screen
let s:TerminalToggleOn=0
function! TerminalToggle()
    if s:TerminalToggleOn == 0
        let s:TerminalToggleOn = 1
        wincmd b
        if has("nvim")
            bot sp
            set nonumber
            terminal
            resize 10
        else
            bot terminal
            resize 10
        endif
        let b:Terminal=1
    else
        let s:TerminalToggleOn = 0
        wincmd b
        q!
    endif
endfunction
command! TT call TerminalToggle()

" Delete buffere without losing split window
function! DeleteBufferSafely()
    if exists("b:Terminal") ||  exists("b:NERDTree")
        echoerr "Can't safely delete this buffer"
        return
    endif
    bp
    while exists("b:Terminal") ||  exists("b:NERDTree")
        bp
    endwhile
    sp
    bn
    while exists("b:Terminal") || exists("b:NERDTree")
        bn
    endwhile
    bd
    resize +15
endfunction
command! BD call DeleteBufferSafely()

" alias to NERDTreeToggle
command! NTT NERDTreeToggle

" IDE mode when openning a directory
function! OnIDEMode()
    if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
        exe 'NERDTree' argv()[0]
        wincmd p
        ene
        exe 'cd '.argv()[0]
        NERDTreeToggle
        call TerminalToggle()
        NERDTreeToggle
    endif
endfunction
autocmd VimEnter * call OnIDEMode()
autocmd StdinReadPre * let s:std_in=1
function! IDEToggle()
    if exists("g:NERDTree") && g:NERDTree.IsOpen() && s:TerminalToggleOn == 1
        TT
        NTT
    elseif exists("g:NERDTree") && g:NERDTree.IsOpen()
        NTT
    elseif s:TerminalToggleOn == 1
        TT
    else
        TT
        NTT
    endif
endfunction
command! IDE call IDEToggle()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""" Plugins Start\""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax check
Plug 'scrooloose/syntastic' 

" Side menu
Plug 'preservim/nerdtree'
let NERDTreeMinimalUI=1
let g:NERDTreeWinSize=30

" Git info
Plug 'tpope/vim-fugitive'

" Dracula
Plug 'dracula/vim'
if !has('nvim')
    let g:dracula_italic = 0
endif

" Side menu icons
Plug 'ryanoasis/vim-devicons'

" Side menu icons colors
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Side menu git support
Plug 'Xuyuanp/nerdtree-git-plugin'

" Top & Bottom Bars
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts=1 " requires fonts like font-firacode-nerd-font
if has("nvim") 
    let g:airline#extensions#tabline#enabled=1
endif

" Start menu
Plug 'mhinz/vim-startify'

" Coq support
Plug 'let-def/vimbufsync'
if !has("nvim")
    Plug 'whonore/Coqtail'
endif

" end vim-plug section
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""" Plugins End\""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Call dracula - must be placed after VimPlug
colorscheme dracula

" Hide '~' from the end of the file view - must be placed after the 'colorscheme' command
highlight EndOfBuffer ctermfg=bg ctermbg=bg
