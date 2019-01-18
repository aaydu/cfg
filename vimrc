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
	"let g:gruvbox_contrast_dark='hard'

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
set cursorline
"set cursorcolumn
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
set showcmd
set mouse=a
set noswapfile

" Set ö as leader
:let mapleader = "ö"

" Use leader to get into normal mode
inoremap <leader> <Esc><right>

" More convenient saving/closing
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>wq :wq<CR>

" hjkl to i(up)j(left)k(down)l(right)
noremap i k
noremap i k
noremap j h
noremap j h
noremap k j
noremap k j
noremap h i
noremap h i


" Remap delete to not overwrite current buffer
nnoremap d "_d
nnoremap D "_D

" Remap up/down scrolling
nnoremap <c-i> <c-b>
nnoremap <c-k> <c-f>

" Remap undo
nnoremap z <c-r>

" Remap fold
nnoremap <Space> za

" Remap search/replace
nnoremap <Leader>f /
nnoremap <Leader>r :%s/<C-R><C-W>//g<left><left>

" Don't leave normal mode when using o/O 
nnoremap o o<Esc>
nnoremap O O<Esc>

" Smart pairs
inoremap "" ""<left>
inoremap '' ''<left>
inoremap (( ()<left>
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
