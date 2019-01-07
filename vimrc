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
set clipboard=unnamedplus
set go+=a
set list listchars=tab:\ \ ,trail:-
set nohlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set mouse=a
set noswapfile

" Set ö as leader
:let mapleader = "ö"

" Use leader to get into normal mode (remove ctrl c)
inoremap <leader> <Esc><right>
inoremap <c-c> <Esc>:t.<CR>i

" Use leader+w for saving and leader+q for quitting
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>wq :wq<CR>

" hjkl to i(up)j(left)k(down)l(right)
noremap i k
noremap I K
noremap j h
noremap J H
noremap k j
noremap K J
noremap h i
noremap H I

" Faster up/down scrolling
nnoremap <c-i> <c-b>
nnoremap <c-k> <c-f>

" Rebind undo
nnoremap z <c-r>

" Rebind fold
nnoremap <Space> za

" Faster find /replace
inoremap <c-f> <Esc>:/
nnoremap <c-f> :/
inoremap <c-r> <Esc>:%s/<C-R><C-W>//g<left><left>
nnoremap <c-r> :%s/<C-R><C-W>//g<left><left>

" Don't leave normal mode when using o/O 
nnoremap o o<Esc>
nnoremap O O<Esc>

" Smart pairs
inoremap "" ""<left>
inoremap '' ''<left>
inoremap [[ []<left>
inoremap {{ {}<left>

" Learn to not use these
noremap <left> <Nop>
noremap <right> <Nop>
noremap <up> <Nop>
noremap <down> <Nop>

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
