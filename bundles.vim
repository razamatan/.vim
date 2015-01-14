" just want vim goodness
set nocompatible

" vundle goodness
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Bundle 'gmarik/vundle'

" solarized color scheme
Bundle 'altercation/vim-colors-solarized'
" search and highlight multiple terms
Bundle 'vim-scripts/multisearch.vim'
" gundo (undo tree)
Bundle 'sjl/gundo.vim'
" recovery
Bundle 'chrisbra/Recover.vim'
" most recently used files
Bundle 'vim-scripts/mru.vim'
" ctrl-p, fuzzy file open
Bundle 'kien/ctrlp.vim'
" vcs integration
Bundle 'git://repo.or.cz/vcscommand.git'
" auto ts and sw
Bundle 'tpope/vim-sleuth'

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

" enhanced python
Bundle 'vim-scripts/python.vim--Vasiliev'
" extend % for python
Bundle 'vim-scripts/python_match.vim'
" pydoc integration
Bundle 'fs111/pydoc.vim'
" jinja
Bundle 'mitsuhiko/vim-jinja'

" latex
Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
" lisp
Bundle 'vim-scripts/slimv.vim'
" dart
Bundle 'dart-lang/dart-vim-plugin'
" json
Bundle 'elzr/vim-json'
" alternate .h/.c
Bundle 'derekwyatt/vim-fswitch'

" completion
if $THIS_DOMAIN != "google.com"
  if has('python') && (v:version > 703 || (v:version == 703 && has('patch584')))
    Bundle 'Valloric/YouCompleteMe'
  else
    Bundle 'ervandew/supertab'
    "Bundle 'vim-scripts/cscope_macros.vim'
  endif
endif

call vundle#end()
filetype plugin on      " for the filetype plugin
filetype indent on      " and indenting is sometimes good
