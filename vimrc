runtime! debian.vim

"#############################################
"#                  Plugins                  #
"#############################################

set nocompatible
filetype off  
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

	Plugin 'VundleVim/Vundle.vim'

	" AutoComplete
	Plugin 'Valloric/YouCompleteMe'
	"set completeopt -= preview
	let g:ycm_autoclose_preview_window_after_completion=1

	" Lightline 
	Plugin 'itchyny/lightline.vim'
	set laststatus=2
	
	" Color scheme
	Plugin 'morhetz/gruvbox'

call vundle#end()           
filetype plugin indent on 

"#############################################
"#                  Settings                 #
"#############################################

syntax on 

colorscheme gruvbox
set background=dark

set number
set relativenumber
set foldenable
set foldmethod=indent
set foldlevel=99
set clipboard=unnamed
set nohlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set mouse=a
set noswapfile

" hjkl to i(up)j(left)k(down)l(right)
noremap i k
nnoremap I <Nop>
noremap j h
noremap J H
noremap k j

" Set ö as leader
:let mapleader = "ö"

" Use leader to get into normal mode (remove ctrl c) 
inoremap <leader> <Esc><right>
inoremap ä <Esc><right>
inoremap <c-c> <Esc>:t.<CR>i<bs> 

" Use leader+w for saving and leader+q for quitting
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>

" Enter insert mode through different convenient ways 
nnoremap <ENTER> i
nnoremap h i
nnoremap <Space> i<Space>
nnoremap <bs> i<bs>

" Rebind undo to more ZZZZc
nnoremap z <c-r>

" Rebind fold
nnoremap <Space> za

" Faster find /replace
inoremap <c-f> <Esc>:/
nnoremap <c-f> :/
inoremap <c-r> <Esc>:%s//g<left><left>
nnoremap <c-r> :%s//g<left><left>

" Rebind jumping to next occurance
nnoremap t f
nnoremap T t

" Switch back to normal mode after inserting new line
nnoremap o o<Esc>
nnoremap O O<Esc>

" Smart pairs
inoremap "" ""<left>
inoremap '' ''<left>
inoremap (( ()<left>
inoremap [[ []<left>
inoremap {{ {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O

" Don't leave normal mode when cutting
vnoremap c c<Esc>
nnoremap c c<Esc>
nnoremap cc cc<Esc>

" Learn to not use these
noremap <left> <Nop>
noremap <right> <Nop>
noremap <up> <Nop>
noremap <down> <Nop>

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
