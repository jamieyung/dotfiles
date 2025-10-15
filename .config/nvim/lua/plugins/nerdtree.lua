return {
    "scrooloose/nerdtree",
    config = function()
        vim.cmd([[
        let NERDTreeShowHidden=1

        " Open NERDTree when vim starts up on opening a directory
        augroup NERDTree
        autocmd!
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

        " Close vim if the only window left open is a NERDTree
        autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
        augroup END
        ]])
    end,
}
