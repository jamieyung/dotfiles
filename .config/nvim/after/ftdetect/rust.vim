au BufNewFile,BufRead *.rs setf rust

" indentation
au FileType rust set expandtab
au FileType rust set shiftwidth=4
au FileType rust set softtabstop=4
au FileType rust set tabstop=4
au FileType rust set foldmethod=indent
