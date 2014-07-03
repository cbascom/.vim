set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'mkitt/tabline.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-unimpaired'

" Github repos of the user 'vim-scripts'
" => can omit the username part

" non github repos

call vundle#end()
filetype plugin indent on     " required!

syntax on

"search looks for matches while typing and highlights the matches
set incsearch
set hlsearch
set ignorecase
set smartcase

"tabs = 4 spaces and auto indent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent

"after 80 characters new line
set textwidth=80

set t_Co=256
colorscheme zenburn

set foldmethod=syntax

" keeps the cursor centered on the screen while searching
set scrolloff=7

"persistent undo and auto backup
set backup
set backupdir=~/.vim/backups

set swapfile
set dir=~/.vim/swap

set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

" better navigation when wrapping
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"breaks on whitespace
set wrap linebreak nolist

"highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"can move away from a changed buffer without warning
set hidden

"Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Only do this part when compiled with support for autocommands
" http://vimcasts.org/episodes/whitespace-preferences-and-filetypes/
if has("autocmd")
  autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType scss,html,css,ruby,eruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript,cucumber,lua setlocal ts=2 sts=2 sw=2 expandtab
  autocmd BufWritePre  *.js,*.rb,*.erb,*.cpp,*.h :%s/\s\+$//e
  autocmd BufWritePre * :%s/\s\+$//e
endif

" Status line including the git branch
set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

"let g:syntastic_auto_loc_list=1
"let g:syntastic_enable_signs=1
"let g:syntastic_check_on_open=1
"let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_ruby_checkers = ['rubylint']
"let g:syntastic_haskell_checkers = ['hlint']
"let g:syntastic_cpp_checkers = ['gcc', 'cpplint']
"let g:syntastic_cpp_cpplint_args="--filter=-legal/copyright,-build/header_guard,-readability/streams"
"let g:syntastic_cpp_compiler_options ='-Wall -std=c++11'

let g:agprg = 'ag --nogroup --nocolor --column'

" Allow for building vWLAN apps from within vi
function! s:MakevWlan(module)
    :let blah=a:module
    :let clean=blah . "_clean"
    :execute ':make ' . clean
    :execute ':make ' . blah
    cwindow
endfunction
command! -nargs=1 Makevwlan call s:MakevWlan(<f-args>)

function! s:MakeAP(product, module)
    :let blah="product=" . a:product . " " . a:module
    :let clean=blah . "_clean"
    :execute ':make ' . clean
    :execute ':make ' . blah
    copen
endfunction

command! -nargs=1 Make1930 call s:MakeAP('1930', <f-args>)
command! -nargs=1 Make1920 call s:MakeAP('1920', <f-args>)
command! -nargs=1 Make1880 call s:MakeAP('1880', <f-args>)
command! -nargs=1 Make1800 call s:MakeAP('1800', <f-args>)

