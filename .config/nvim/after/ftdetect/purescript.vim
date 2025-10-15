au BufNewFile,BufRead *.purs setf purescript

" indentation
au FileType purescript set expandtab
au FileType purescript set shiftwidth=2
au FileType purescript set softtabstop=2
au FileType purescript set tabstop=2
au FileType purescript set foldmethod=indent

"autoformat files prior to saving them
autocmd BufWritePre *.purs lua vim.lsp.buf.format(nil, 1000)
