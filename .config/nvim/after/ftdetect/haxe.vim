autocmd FileType haxe setlocal commentstring=//\ %s

" indentation
au FileType haxe set noexpandtab
au FileType haxe set shiftwidth=4
au FileType haxe set softtabstop=4
au FileType haxe set tabstop=4
au FileType haxe set foldmethod=indent

"autoformat files prior to saving them
autocmd BufWritePre *.hx lua vim.lsp.buf.format(nil, 1000)
