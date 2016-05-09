set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'

call vundle#end()            " required
filetype plugin indent on    " required

set hidden
let g:racer_cmd="/home/fedora/.multirust/toolchains/stable/cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:tagbar_compact = 1
let g:rustfmt_autosave = 1
set completeopt+=noselect

set number
set relativenumber
set laststatus=2
set mouse=a
set shiftwidth=2
set tabstop=2
set expandtab

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

map <C-n> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>:TagbarSetFoldlevel!(99)<CR>
nmap <leader><left> <C-w><left>
nmap <leader><right> <C-w><right>
