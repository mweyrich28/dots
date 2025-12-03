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

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "pyright", "gopls", "clangd", "r_language_server" },
})

-- Lua LSP
vim.lsp.config.lua_ls = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
    capabilities = lsp_capabilities,
    on_attach = lsp_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
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

-- C++ LSP
vim.lsp.config.clangd = {
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
    root_markers = { '.clangd', '.clang-tidy', '.clang-format', 'compile_commands.json', 'compile_flags.txt', 'configure.ac', '.git' },
    capabilities = lsp_capabilities,
    on_attach = function(client, buffer)
        client.server_capabilities.signatureHelpProvider = false
        lsp_attach(client, buffer)
    end,
}

-- Python LSP
vim.lsp.config.pyright = {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { 'pyrightconfig.json', 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', '.git' },
    capabilities = lsp_capabilities,
    on_attach = lsp_attach,
    settings = {
        python = {
            pythonPath = "/home/malte/miniconda3/envs/uni/bin/python"
        }
    }
}


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

-- Enable the LSP servers
vim.lsp.enable('lua_ls')
vim.lsp.enable('gopls')
vim.lsp.enable('clangd')
vim.lsp.enable('r_language_server')
vim.lsp.enable('pyright')

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


