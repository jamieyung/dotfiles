return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
        vim.cmd([[
            let g:mkdp_preview_options = {
                \ 'disable_sync_scroll': 1
                \ }
        ]])
    end,
}
