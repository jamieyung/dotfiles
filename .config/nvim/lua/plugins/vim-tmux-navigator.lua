return {
    "christoomey/vim-tmux-navigator",
    config = function()
        vim.cmd([[
        let g:tmux_navigator_disable_when_zoomed = 1
        let g:tmux_navigator_save_on_switch = 1
        let g:tmux_navigator_no_mappings = 1 "use custom mappings below

        " Meta + direction to move between splits in any mode.
        " On Mac, make sure "Use Option as Meta key" is enabled.
        tnoremap <M-h> <C-\><C-N>:TmuxNavigateLeft<CR>
        tnoremap <M-j> <C-\><C-N>:TmuxNavigateDown<CR>
        tnoremap <M-k> <C-\><C-N>:TmuxNavigateUp<CR>
        tnoremap <M-l> <C-\><C-N>:TmuxNavigateRight<CR>

        inoremap <M-h> <C-\><C-N>:TmuxNavigateLeft<CR>
        inoremap <M-j> <C-\><C-N>:TmuxNavigateDown<CR>
        inoremap <M-k> <C-\><C-N>:TmuxNavigateUp<CR>
        inoremap <M-l> <C-\><C-N>:TmuxNavigateRight<CR>

        nnoremap <M-h> :TmuxNavigateLeft<CR>
        nnoremap <M-j> :TmuxNavigateDown<CR>
        nnoremap <M-k> :TmuxNavigateUp<CR>
        nnoremap <M-l> :TmuxNavigateRight<CR>
        ]])
    end,
}
