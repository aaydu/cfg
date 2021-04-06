"#############################################
"#                  Plugins                  #
"#############################################
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'
    Plugin 'crusoexia/vim-monokai'
    "Plugin 'wmvanvliet/jupyter-vim'
    Plugin 'itchyny/lightline.vim'
    Plugin 'mbbill/undotree'
    Plugin 'Valloric/YouCompleteMe'
    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_disable_signature_help=1

call vundle#end()
filetype plugin indent on

"#############################################
"#                  Settings                 #
"#############################################

syntax on
colorscheme monokai
set background=dark
hi normal ctermbg=NONE guibg=NONE
autocmd VimLeave * call system("xclip -selection clipboard -i", getreg('+'))
autocmd VimEnter * silent !echo -ne "\e[2 q"

set number
set relativenumber
set cursorline
"set cursorcolumn
set laststatus=2
"set foldenable
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
set ttymouse=sgr
set noswapfile
set scrolloff=10
set tabstop=4 shiftwidth=4 expandtab
set undofile
set undodir=~/.vim/undodir

" Set ; as leader
:let mapleader = " "

" Use leader to get into normal mode
inoremap <c-space> <Esc>
vnoremap <space> <Esc>

" Unmap useless, annoying stuff
nnoremap Q <Nop>
nnoremap K <Nop>
inoremap <c-p> <Nop>
inoremap <c-h> <Nop>

" More convenient saving/closing (ZZ/ZQ too dangerous ~,~)
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" Visual lines instead of logical lines
noremap k gk
noremap j gj

" Remap annoying buffer overwriting when deleting
noremap d "_d
noremap dd "_dd
noremap D "_D
noremap c "_c
noremap cc "_cc
noremap C "_C
noremap s "_s
noremap S "_S
noremap x "_x
noremap X "_X
vnoremap p "_dP

" Make cutting possible with leader
noremap <Leader>d d
noremap <Leader>dd dd
noremap <Leader>D D
noremap <Leader>x x
noremap <Leader>X "_X

" Make Y consistent with D and C
nnoremap Y y$

" Remap redo
"nnoremap z <c-r>

" Open undo-tree plugin
nnoremap <leader>U :UndotreeToggle<CR>

" Search/replace
nnoremap <Leader>r :%s/<C-R><C-W>//g<left><left>

" Don't leave normal mode when using o/O
nnoremap o o<Esc>
nnoremap O O<Esc>

" Select all
nnoremap <Leader>v ggVG

" Smart indent
nnoremap > >>
nnoremap < <<
vnoremap < <gv
vnoremap > >gv

" Commenting out in visual block mode
vnoremap # :s/^/#/<Esc><Esc>
"vnoremap ' :s/#/<Esc><Esc>

" Smart insertion of 'surrounding' chars
vnoremap " c""<Esc><left>pb
vnoremap ' c''<Esc><left>pb
vnoremap ( c()<Esc><left>pb
vnoremap [ c[]<Esc><left>pb
vnoremap { c{}<Esc><left>pb

" Pane movement/control
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>- <C-w>-
nnoremap <Leader>+ <C-w>+
nnoremap <Leader>= <C-w>=

" Execute python in connected Jupyter-Console
autocmd FileType python nnoremap <Leader>e :JupyterSendCount<CR>
autocmd FileType python nnoremap <Leader>E :JupyterRunFile<CR>
autocmd FileType python vnoremap <Leader>e :JupyterSendRange<CR>

autocmd FileType tex,latex nnoremap <Leader>w :w<CR> :!texi2pdf %<CR><CR>
"autocmd FileType markdown nnoremap <Leader>w :w<CR> :!pandoc -t html --css='style.css' -o README.html %<CR><CR>
