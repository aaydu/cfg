runtime! debian.vim

"#############################################
"#                  Plugins                  #
"#############################################

set nocompatible
filetype off  
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

	Plugin 'VundleVim/Vundle.vim'
	
	" Lightline 
	Plugin 'itchyny/lightline.vim'
	set laststatus=2
	
	" Color scheme
	Plugin 'morhetz/gruvbox'
	colorscheme gruvbox
	set background=dark

call vundle#end()           
filetype plugin indent on  

"#############################################
"#                  Settings                 #
"#############################################
"

syntax on 

:set number
:set foldenable
:set foldmethod=indent
:set foldlevel=99
:set clipboard=unnamed
:set hlsearch
:set incsearch
:set showmatch
:set mouse=a
:set noswapfile

" hjkl to i(up)j(left)k(down)l(right)
noremap i k
noremap j h
noremap k j

" Set ö as leader
:let mapleader = "ö"

" Use leader to get into normal mode (remove ctrl c) 
:inoremap <leader> <Esc>
:inoremap <c-c> c

" Use leader+w for saving and leader+q for quitting
:nnoremap <Leader>w :w<CR>
:nnoremap <Leader>q :q<CR>
:nnoremap <Leader>wq :wq<CR>

" Enter insert mode trough enter
:nnoremap <ENTER> i

" Switch back to normal mode after inserting new line
:nnoremap o o<Esc>
:nnoremap O O<Esc>

" Smart Brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Switch cut/copy/print from C Y P to X C V
vnoremap <c-x> c
vnoremap <S-Del> c
vnoremap <c-c> y
vnoremap <C-Insert> y
map <c-v> p
map <s-insert> p

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
