"#############################################
"#                  Plugins                  #
"#############################################
source /opt/homebrew/Cellar/fzf/0.55.0/plugin/fzf.vim
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'
    Plugin 'crusoexia/vim-monokai'
    Plugin 'itchyny/lightline.vim'
    Plugin 'mbbill/undotree'
    "Plugin 'puremourning/vimspector'

    "Plugin 'xavierd/clang_complete'
    "let g:clang_library_path='/opt/homebrew/Cellar/llvm/14.0.6/lib'
    "let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/'
    "let g:clang_close_preview=1
    "let g:clang_auto_select=0
    "set completeopt=menu,longest

    Plugin 'Valloric/YouCompleteMe'
    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_disable_signature_help=1
    let g:ycm_key_invoke_completion=''

    Plugin 'junegunn/fzf.vim'
    let g:fzf_layout = {'down': '40%'}
    "let g:fzf_action = {'ctrl-at': 'exit'}


call vundle#end()
filetype plugin indent on

"#############################################
"#                  Settings                 #
"#############################################

syntax on
colorscheme monokai
set background=dark
hi normal ctermbg=NONE guibg=NONE
"autocmd VimLeave * call system("xclip -selection clipboard -i", getreg('+'))
"let &t_SI = "\e[5 q" " bar cursor in insert mode
"let &t_EI = "\e[1 q" " box cursor in normal mode
"let &t_SR = "\e[1 q" " box cursor in replace mode

set number
set relativenumber
set cursorline
set laststatus=2
set foldmethod=indent
set foldlevel=99
set clipboard=unnamed
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
inoremap <c-@> <Esc>
vnoremap <c-@> <Esc>
vnoremap <space> <Esc>

" Unmap useless stuff
nnoremap Q <Nop>
nnoremap K <Nop>
inoremap <c-p> <Nop>
inoremap <c-h> <Nop>

" More convenient saving/closing
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

" Python debugger
nnoremap <Leader>gl :call vimspector#Launch()<CR>
nnoremap <Leader>gq :call vimspector#Reset()<CR>
nnoremap <Leader>gc :call vimspector#Continue()<CR>
nnoremap <Leader>gb :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>gso :call vimspector#StepOver()<CR>
nnoremap <Leader>gsi :call vimspector#StepOver()<CR>

" fzf
nnoremap <Leader>ff :GFiles<CR>
command! -bang -nargs=* RgGit call fzf#vim#grep('rg "" $(git_root=$(git rev-parse --show-toplevel); python3 -c "import os; print(os.path.relpath(\"$git_root\", \"$(pwd)\"))") --vimgrep --line-number --smart-case --follow --color "always"', fzf#vim#with_preview())
nnoremap <Leader>fv :RgGit<cr>

