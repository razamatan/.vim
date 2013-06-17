" just want vim goodness
set nocompatible

" vundle goodness
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" solarized color scheme
Bundle 'altercation/vim-colors-solarized'
" search and highlight multiple terms
Bundle 'vim-scripts/multisearch.vim'
" more powerful . command
Bundle 'tpope/vim-repeat'
" more powerful % command
Bundle 'vim-scripts/matchit.zip'
" html/xml mappings, enhances vim-surround
Bundle 'tpope/vim-ragtag'
" modify surrounding syntax
Bundle 'tpope/vim-surround'
" check syntax of scripts
Bundle 'vim-scripts/checksyntax-B'
" buffer execution
Bundle 'vim-scripts/Bexec'
" align statements
Bundle 'vim-scripts/Align'
" alternate .h/.c
Bundle 'vim-scripts/a.vim'
" most recently used files
Bundle 'vim-scripts/mru.vim'
" vcs integration
Bundle 'git://repo.or.cz/vcscommand.git'
" enhanced python
Bundle 'vim-scripts/python.vim--Vasiliev'
" extend % for python
Bundle 'vim-scripts/python_match.vim'
" pydoc integration
Bundle 'fs111/pydoc.vim'
" latex
Bundle 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX'
" lisp
Bundle 'vim-scripts/slimv.vim'
" completion
if $THIS_DOMAIN == 'mac'
   Bundle 'ervandew/supertab'
   "Bundle 'vim-scripts/cscope_macros.vim'
else
   Bundle 'Valloric/YouCompleteMe'
endif

filetype plugin on      " for the filetype plugin
filetype indent on      " and indenting is sometimes good
