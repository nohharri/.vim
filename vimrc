set nocompatible

" Text editing
set backspace=indent,eol,start
set cino=:0 " No indent for case:/default:
set shiftwidth=4
set tabstop=4

" Interface
set guifont=DejaVu_Sans_Mono:h12
set hidden
set hlsearch
set nowrap
set ruler
set wildmenu
set wildmode=longest:full,full

" Color scheme
set background=dark
syntax enable
colorscheme sunburst
if has('gui_macvim')
	set transparency=10
endif

" Commands that shell out tend to assume a bourne shell
set shell=sh

" If we don't have vim plug installed, install it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" vim-plug
call plug#begin('~/.vim/bundle')

Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'fatih/vim-go'
Plug 'mustache/vim-mustache-handlebars'
Plug 'evidens/vim-twig'
Plug 'Shutnik/jshint2.vim'
Plug 'StanAngeloff/php.vim'
Plug 't-yuki/vim-go-coverlay'

call plug#end()

" NERDTree
map <c-\> :NERDTreeToggle<CR>

" ctrlp
autocmd VimEnter * silent! unmap <c-p>|map <c-p> :CtrlPMixed<CR>

" vim-twig
au BufReadPost *.swig set syntax=twig
au BufReadPost *.tpl set syntax=twig

" vim-go
let g:go_fmt_command = "goimports"

" Useful for developing color themes
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
	\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
	\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
