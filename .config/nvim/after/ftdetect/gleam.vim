"autoformat files prior to saving them
autocmd BufWritePre *.gleam lua vim.lsp.buf.format(nil, 1000)
