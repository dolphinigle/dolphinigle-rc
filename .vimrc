set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/DeleteTrailingWhitespace'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'koron/nyancat-vim'

filetype plugin indent on

set smartcase
set incsearch
set number
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smartindent
set expandtab
set colorcolumn=100
set backspace=indent,eol,start
set tw=100

au FileType python setl shiftwidth=2 tabstop=2

let g:syntastic_python_checkers = ['pylint']

let g:ycm_extra_conf_globlist = ['~/.ycm_extra_conf.py']

syntax on

:map z \\

autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ -Wall -std=c++11 '.shellescape('%').' -o '.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F5> :w <bar> exec '!./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F3> :w <bar> exec '!g++ -Wall -std=c++11 -g '.shellescape('%').' -o '.shellescape('%:r') <bar> Cfile %:r<CR>
autocmd filetype c nnoremap <F3> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r') <bar> Cfile %:r<CR>

autocmd filetype python nnoremap <F5> :w <bar> exec '!python '.shellescape('%')<CR>

autocmd filetype tex nnoremap <F4> :w <bar> silent exec '!latex -interaction nonstopmode '.shellescape('%') <bar> silent exec '!bibtex '.shellescape('%:r') <bar> silent exec '!latex -interaction nonstopmode '.shellescape('%') <bar> exec '!pdflatex '.shellescape('%')<CR>
autocmd filetype tex nnoremap <F5> :w <bar> exec '!evince '.shellescape('%:r').'.pdf'<CR>
autocmd filetype html nnoremap <F5> :w <bar> exec '!google-chrome '.shellescape('%:r').'.html'<CR>

fun! Clewn()
  Pyclewn
  Cmapkeys
endfunction
:command Clewn :call Clewn()

:let g:languagetool_jar='$HOME/RACK/SOFTWARE/VIM/LanguageTool-2.4.1/languagetool-commandline.jar'

" Persistent undo
set undodir=/home/dolphinigle/vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" Text wrap for latex
augroup WrapLineInTeXFile
  autocmd!
  autocmd FileType tex setlocal wrap
augroup END

