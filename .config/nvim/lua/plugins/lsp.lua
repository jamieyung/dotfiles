return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local bufnr = args.buf
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'LSP go to definition' })
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'LSP hover' })
                vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, { buffer = bufnr, desc = 'LSP references' })
                vim.keymap.set('n', '<leader>c', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'LSP code action' })
                vim.keymap.set('n', '<c-p>', vim.diagnostic.goto_prev, { buffer = bufnr, desc = 'LSP go to prev diagnostic' })
                vim.keymap.set('n', '<c-n>', vim.diagnostic.goto_next, { buffer = bufnr, desc = 'LSP go to next diagnostic' })
            end,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        vim.lsp.config('purescriptls', {
            settings = {
                purescript = {
                    addSpagoSources = true,
                }
            },
            flags = {
                debounce_text_changes = 150,
            }
        })
        vim.lsp.enable({'purescriptls'})

        vim.lsp.config('cssls', {
            capabilities = capabilities,
        })
        vim.lsp.enable({'cssls'})

        vim.lsp.config('gleam', {
            capabilities = capabilities,
        })
        vim.lsp.enable({'gleam'})

        vim.lsp.config('hls', {
            capabilities = capabilities,
            filetypes = { "haskell", "lhaskell", "cabal" },
        })
        vim.lsp.enable({'hls'})

        vim.lsp.config('haxe_language_server', {
            capabilities = capabilities,
            cmd = {"node", "/Users/jamie/workspace/haxe-language-server/bin/server.js"},
        })
        vim.lsp.enable({'haxe_language_server'})


        vim.lsp.config('rust_analyzer', {
            capabilities = capabilities,
            settings = {
                ['rust-analyzer'] = {
                    assist = {
                        importGranularity = 'module',
                        importPrefix = 'by_self',
                    },
                    cargo = {
                        allFeatures = true,
                        loadOutDirsFromCheck = true
                    },
                    diagnostics = {
                        enable = true,
                        disabled = {'unresolved-proc-macro'},
                        enableExperimental = true,
                    },
                    procMacro = {
                        enable = true
                    },
                },
            },
        })
        vim.lsp.enable({'rust_analyzer'})

        vim.lsp.config('gopls', {
            cmd = {'gopls'},
            capabilities = capabilities,
            settings = {
                gopls = {
                    experimentalPostfixCompletions = true,
                    analyses = {
                        fillstruct = true,
                        unusedparams = true,
                        shadow = true,
                    },
                    staticcheck = true,
                },
            },
        })
        vim.lsp.enable({'gopls'})
    end
}
