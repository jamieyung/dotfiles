return {
    "junegunn/fzf.vim",
    config = function()
        vim.cmd([[
            let $FZF_DEFAULT_COMMAND="rg --files --ignore-vcs --hidden -g '!\.git/*' -g '!deps/*'"
        ]])
    end,
}
