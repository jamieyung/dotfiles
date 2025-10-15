" indentation
au FileType haskell set expandtab
au FileType haskell set shiftwidth=2
au FileType haskell set softtabstop=2
au FileType haskell set tabstop=2
au FileType haskell set foldmethod=indent

"autoformat files prior to saving them
autocmd BufWritePre *.hs lua vim.lsp.buf.format(nil, 1000)
