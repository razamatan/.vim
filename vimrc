" the leader character is \
source ~/.vim/bundles.vim

syntax on               " pretty colors

set enc=utf-8           " utf-8
set expandtab           " i don't like tabs
set tabstop=3           " how to handle tabs
set shiftwidth=3
set list
set listchars=tab:>-,trail:-

set cpoptions+=$        " 'c' & 's' functionality
set noautoindent                " but not too much...
set ruler               " see where i'm @
set laststatus=2        " always show status line
set scrolloff=3         " always show lines around cursor
set showcmd             " show what command i'm doing
set hidden              " no write on buffer switch
set background=dark

set wildmode=longest,full  " filename completion
set wildmenu               " filename completion
set hlsearch               " highlight search matches
set incsearch              " incremental search
set ic scs                 " case-insentive, smart case search
set modeline
set modelines=5

" completion
if has('patch584')  " we're more than likely using ycm
   let g:EclimCompletionMethod = 'omnifunc'
   let g:ycm_autoclose_preview_window_after_insertion = 1
endif
if filereadable(expand('~/.vim/bundle/supertab/plugin/supertab.vim'))
   set completeopt=menuone,longest
   let g:SuperTabDefaultCompletionType = 'context'
endif

set shell=/bin/bash
set grepprg=grep\ -nH\ $*
set tags=tags;/

let g:netrw_liststyle=3       " tree
"let g:netrw_browse_split=4    " 0 same window, 1 horiz, 2 vert, 3 new tab, 4 previous window
"let g:netrw_preview=1         " 0 horizontal split, 1 vertical split

" colors
if $COLORTERM == "gnome-terminal"
   set t_Co=256
endif
exe "let g:solarized_termcolors=".&t_Co
let g:solarized_termtrans=1
colorscheme solarized
"hi StatusLine cterm=reverse
"hi StatusLineNC cterm=reverse ctermfg=DarkGrey
"hi Search ctermfg=White ctermbg=DarkBlue

" window movement
nmap <C-Up> :wincmd k<CR>
nmap <C-Down> :wincmd j<CR>
nmap <C-Right> :wincmd l<CR>
nmap <C-Left> :wincmd h<CR>

" buffer movement
nmap <C-P> :bp<CR>
nmap <C-N> :bn<CR>

" line indenting
set cinkeys-=0#         " prevent # from autoflushing left
"set t_kB=[Z           " hit ctrl-v and S-Tab
inoremap <S-Tab> <C-O><LT><LT>
nnoremap <Tab> >>
nnoremap <S-Tab> <LT><LT>
vnoremap <Tab> >
vnoremap <S-Tab> <LT>
map -- gg=G''

" function keys
" <F5> buffer selection (switch)
nmap <F5> :ls<CR>:e #
" <F8> spellchecking
if has("spell")
   set spelllang=en_us
   nmap <F8> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
else
   nmap <F8> <Bar>:echo "Spell Check Unavailable"<CR>
endif
" <F9> pastetoggle
set pastetoggle=<F9>
" <F12> gqap (cluster & autowrap)
nmap <F12> gqap

" macros
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
nmap <Leader>date :r!date<CR>
nmap <Leader>tag  :!tagup<CR>
nmap <Leader>make :w<CR>:!makeup<CR>

" functions
function! AppendModeline()
   let l:save_cursor = getpos('.')
   let l:append = ' vim: set ts='.&tabstop.' sw='.&shiftwidth.':'
   $put =substitute(&commentstring, '%s', l:append, '')
   call setpos('.', l:save_cursor)
endfunction

function! SetTitle()
   let l:title = 'vi: ' . expand('%:t')
   let l:truncTitle = strpart(l:title, 0, 15)
   silent exe '!echo -e -n "\033k' . l:truncTitle . '\033\\"'
endfunction
" Run it every time we change buffers
"autocmd BufEnter * call SetTitle()

" misc autocmds
au Filetype mail set tw=0

" plugin related
let python_highlight_all=1
let bexec_rehighlight=1

" latex stuff
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_ViewRule_pdf = 'xpdf'
let g:Tex_ViewRule_dvi = 'xdvi'
" (ctrl-space) for those <++>
imap <Nul> <Plug>IMAP_JumpForward
nmap <Nul> <Plug>IMAP_JumpForward

" last position jump
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" vimdiff
if &diff
   nmap <C-P> [cz.
   nmap <C-N> ]cz.
   nmap <C-L>u :diffupdate<CR><C-L>
   nmap Q :qa<CR>
endif

" platform specific overrides
let osvimrc = expand('~/.vim/os/'.substitute(system("uname"), "\n", "", ""))
if filereadable(osvimrc)
   exe "source ".osvimrc
endif

" host based overrides
if filereadable( expand("~/.dotfiles.$THIS_DOMAIN/vimrc") )
   source ~/.dotfiles.$THIS_DOMAIN/vimrc
endif
if filereadable( expand("~/.vim/host/$THIS_DOMAIN") )
   source ~/.vim/host/$THIS_DOMAIN
endif
if filereadable( expand("~/.vim/host/$THIS_HOST") )
   source ~/.vim/host/$THIS_HOST
endif
