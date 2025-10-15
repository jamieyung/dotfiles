" indentation
au FileType html set expandtab
au FileType html set shiftwidth=2
au FileType html set softtabstop=2
au FileType html set tabstop=2
au FileType html set foldmethod=indent

"autoformat files prior to saving them
autocmd BufWritePre *.html lua vim.lsp.buf.format(nil, 1000)
