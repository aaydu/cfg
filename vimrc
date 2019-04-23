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
	let g:ycm_autoclose_preview_window_after_completion=1

	" Lightline
	Plugin 'itchyny/lightline.vim'
	set laststatus=2
	
	" Color scheme
	"Plugin 'morhetz/gruvbox'
	Plugin 'crusoexia/vim-monokai'
	"let g:gruvbox_contrast_dark='hard'

	Plugin 'wmvanvliet/jupyter-vim'
	let g:jupyter_mapkeys=1
		

call vundle#end()
filetype plugin indent on

"#############################################
"#                  Settings                 #
"#############################################

syntax on
colorscheme monokai
set background=dark
hi normal ctermbg=NONE guibg=NONE

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
"set mouse=a
set noswapfile

" Set ö/Ö as leader
:let mapleader = "ö"
imap Ö <leader>

" Use leader to get into normal mode
inoremap <leader> <Esc><right>
vnoremap <leader> <Esc>

" Unmap Q to disable Ex-mode
nnoremap Q <Nop>

" More convenient saving/closing
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" hjkl to i(up)j(left)k(down)l(right)
noremap i k
noremap I K
noremap j h
noremap J H
noremap k j
noremap K J
noremap h i
noremap H I

" visual lines
noremap gk gj
noremap gi gk

" Faster jumping using ALT
nnoremap i 5k
nnoremap k 5j

" Jumping between splits
noremap <C-W>i <C-W>k
noremap <C-W>j <C-W>h
noremap <C-W>k <C-W>j
noremap <C-W>h <C-W>i

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

" Select all
nnoremap <Leader>v ggVG

" Commenting out in visual block mode
vnoremap # :s/^/#/<Esc><Esc>
"vnoremap ' :s/#/<Esc><Esc>

" Smart pairs
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" Smart insertion of 'surrounding' chars
vnoremap " c""<Esc><left>pb
vnoremap ' c''<Esc><left>pb
vnoremap ( c()<Esc><left>pb
vnoremap [ c[]<Esc><left>pb
vnoremap { c{}<Esc><left>pb

" Learn to not use these
noremap <left> <Nop>
noremap <right> <Nop>
noremap <up> <Nop>
noremap <down> <Nop>

" Execute python in connected Jupyter-Console
" (hacky workaround because 'JupyterSendRange' doesn't work)
autocmd FileType python nnoremap <Leader>e :JupyterSendCount<CR>
autocmd FileType python nnoremap <Leader>E :JupyterRunFile<CR>
autocmd FileType python vnoremap <Leader>e c##<Esc>o##<up><Esc>p:JupyterSendCell<CR>u<up>

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
