" if vim --version command on terminal or :echo has('clipboard') returns zero
" on vim, you have to install vim-gtk3 which will give clipboard support and
" others as well

set number relativenumber
set nu rnu

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=/usr/share/vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" map the leader
let mapleader="-"
nnoremap <leader><Space> /<++><CR><ESC>ci<

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dracula/vim'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" vim-airline theme selection:

let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg ='light'
let g:dracula_colorterm = 1

" solarized setups:
syntax enable
set t_Co=256 "for tmux to run on 256 colors
set t_ut= "for tmux to disable Background Color Erase (BCE)
"set background=light
"let g:solarized_termcolors=256
color dracula

" NERDTree command binding
map <C-n> :NERDTreeToggle<CR>

" changing cursors for insert mode:
"
"    1 is the blinky block cursor
"    2 is the default (non-blinky) block cursor
"    3 is blinky underscore
"    4 fixed underscore
"    5 pipe bar (blinking)
"    6 fixed pipe bar
let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[5 q"
let &t_EI = "\<esc>[2 q"
