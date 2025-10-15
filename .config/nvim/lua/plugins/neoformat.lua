return {
    "sbdchd/neoformat",
    config = function()
        vim.cmd([[
        let g:neoformat_enabled_purescript = ['purstidy']
        let g:neoformat_enabled_gleam = ['gleam format']

        " format on save
        augroup fmt
        autocmd!
        autocmd BufWritePre *.purs Neoformat
        autocmd BufWritePre *.gleam Neoformat
        augroup END
        ]])
    end,
}
