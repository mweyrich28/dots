return {
    "neovim/nvim-lspconfig",
    dependencies = {

    },
    config = function()
        -- python __pycache
        vim.env.PYTHONDONTWRITEBYTECODE = "1"


        vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

        local lsp_attach = function(client, bufnr)
            local opts = { buffer = bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<C-f>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set('n', '<space>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<space>f', function()
                vim.lsp.buf.format { async = true }
            end, opts)
        end


        -- Lua LSP
        vim.lsp.config.lua_ls = {
            cmd = { 'lua-language-server' },
            filetypes = { 'lua' },
            root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
            capabilities = lsp_capabilities,
            on_attach = lsp_attach,
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    },
                    completion = {
                        callSnippet = 'Replace',
                    },
                    diagnostics = {
                        enable = true,
                        globals = { 'vim', 'use' },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file('', true),
                        maxPreload = 10000,
                        preloadFileSize = 10000,
                    },
                    telemetry = { enable = false },
                },
            },
        }

        -- Go LSP
        vim.lsp.config.gopls = {
            cmd = { 'gopls' },
            filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
            root_markers = { 'go.work', 'go.mod', '.git' },
            capabilities = lsp_capabilities,
            on_attach = lsp_attach,
            settings = {
                gopls = {
                    gofumpt = true,
                    staticcheck = true,
                    semanticTokens = true,
                    completeUnimported = true,
                    usePlaceholders = true,
                    analyses = {
                        unusedparams = true,
                        shadow = true,
                    },
                    ["local"] = "",
                },
            },
        }

        -- Python LSP
        vim.lsp.config.pyright = {
            cmd = { 'pyright-langserver', '--stdio' },
            filetypes = { 'python' },
            root_markers = { 'pyrightconfig.json', 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', '.git' },
            capabilities = lsp_capabilities,
            on_attach = lsp_attach,
        }
        -- vim.lsp.config.pylsp = {
        --     cmd = { 'pylsp' },
        --     filetypes = { 'python' },
        --     root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', '.git' },
        --     capabilities = lsp_capabilities,
        --     on_attach = lsp_attach,
        --     settings = {
        --         pylsp = {
        --             plugins = {
        --                 pycodestyle = { enabled = false },
        --                 mccabe = { enabled = false },
        --                 pyflakes = { enabled = false },
        --                 -- Enable better plugins:
        --                 pylsp_mypy = { enabled = true },
        --                 ruff = { enabled = true }, -- if installed
        --             }
        --         }
        --     }
        -- }


        vim.lsp.config.r_language_server = {
            cmd = {
                "R",
                "--quiet",
                "--no-save",
                "--no-restore",
                "--slave",
                "-e",
                "languageserver::run()"
            },
            filetypes = { "r", "rmd", "quarto" },
            root_markers = { ".Rproj", ".git" },
            capabilities = lsp_capabilities,
            on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = true
                client.server_capabilities.documentRangeFormattingProvider = true
                lsp_attach(client, bufnr)
            end,
        }
        -- Rust LSP
        vim.lsp.config.rust_analyzer = {
            cmd = { 'rust-analyzer' },
            filetypes = { 'rust' },
            root_markers = { 'Cargo.toml', 'rust-project.json', '.git' },
            capabilities = lsp_capabilities,
            on_attach = lsp_attach,
            settings = {
                ['rust-analyzer'] = {
                    cargo = {
                        allFeatures = true,
                    },
                    check = {
                        command = "clippy",
                    },
                },
            },
        }

        -- Enable the LSP servers
        vim.lsp.enable('lua_ls')
        vim.lsp.enable('gopls')
        vim.lsp.enable('r_language_server')
        vim.lsp.enable('pyright')
        vim.lsp.enable('rust_analyzer')

        -- Globally configure all LSP floating preview popups
        local open_floating_preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or "rounded"
            return open_floating_preview(contents, syntax, opts, ...)
        end

        -- Diagnostic configuration
        vim.diagnostic.config({
            virtual_text = {
                severity = {
                    min = vim.diagnostic.severity.WARN,
                },
                spacing = 2,
            },
        })
    end,
}
