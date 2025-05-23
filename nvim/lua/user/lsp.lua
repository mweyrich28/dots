require("neodev").setup({
    -- add any options here, or leave empty to use the default settings
})


vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_attach = function(client, bufnr)
    -- Create your keybindings here...
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
    automatic_enable = false, -- default, optional
})


-- Lua LSP settings
lspconfig.lua_ls.setup {
    on_attach = lsp_attach,
    capabilities = lsp_capabilities,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
        },
    },
}

-- go
lspconfig.gopls.setup {
    settings = {
        gopls = {
            gofumpt = true,     -- Use gofumpt instead of gofmt
            staticcheck = true, -- Enable static analysis checks
            semanticTokens = true,
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true, -- Detect unused parameters
                shadow = true,       -- Detect variable shadowing
            },
            ["local"] = "",          -- Auto-group imports
        },
    },
    on_attach = lsp_attach,
    capabilities = lsp_capabilities,
}
-- c++
lspconfig.clangd.setup {
    on_attach = function(client, buffer)
        client.server_capabilities.signatureHelpProvider = false
        lsp_attach(client, buffer)
    end,
    capabilities = lsp_capabilities,
}

-- R
lspconfig.r_language_server.setup({
    cmd = { "R", "--slave", "-e", "languageserver::run()" },
    filetypes = { "r", "rmd" },
    root_dir = require('lspconfig.util').root_pattern(".git", ".Rproj", "."),
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
})

-- Globally configure all LSP floating preview popups (like hover, signature help, etc)
local open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "rounded" -- Set border to rounded
    return open_floating_preview(contents, syntax, opts, ...)
end

vim.diagnostic.config({
    virtual_text = {
        severity = {
            min = vim.diagnostic.severity.WARN,
        },
        spacing = 2,
    },
})
