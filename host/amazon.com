set makeprg=makeup
"au BufNewFile,BufRead *.m,*.mi,*.mhtml set filetype=mason
au FileType java set makeprg=antup
au FileType java set efm=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,\%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
 za, zc, zo; zm/zr
au FileType java set foldmethod=indent foldlevel=99 " foldcolumn=2
au FileType java set tabstop=4 shiftwidth=4

" vim: set ft=vim :
