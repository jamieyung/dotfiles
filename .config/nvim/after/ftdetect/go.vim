au BufNewFile,BufRead *.go setf go

" indentation
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
au FileType go set foldmethod=indent

let g:go_diagnostics_level=2 "show errors and warnings
let g:go_auto_type_info=1 "show type info in status line when hovering over a variable

"autoformat files prior to saving them
autocmd BufWritePre *.go lua vim.lsp.buf.format(nil, 1000)

lua <<EOF
  function go_org_imports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
  end
EOF
autocmd BufWritePre *.go lua go_org_imports(1000)
