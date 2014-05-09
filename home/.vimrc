set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932
set fileformats=unix,dos,mac
set number
syntax on
:colorscheme koehler

set splitright

set ruler
set laststatus=2

set list
set lcs=tab:>\ ,eol:<,trail:_,extends:\

set backspace=indent,eol,start

set tabstop=4
set shiftwidth=4
set expandtab
set foldmethod=marker

" indent 2 when ruby
augroup WriteRuby
  autocmd!
  au FileType ruby setlocal tabstop=2
  au FileType ruby setlocal shiftwidth=2
augroup END

noremap zd zo
noremap zs zR
noremap zx zM

"--------------------------------------------------------------------------
" neobundle
set nocompatible " Be iMproved
filetype off " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'https://github.com/thinca/vim-quickrun.git'

filetype plugin indent on " Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif
