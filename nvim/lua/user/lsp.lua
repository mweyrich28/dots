--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
    lua_ls = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            hint = {
                enable = true,
                arrayIndex = 'Disable',
                setType = true,
            },
        },
    },


}

-- local signature_setup = {
--   bind = true,
--   doc_lines = 0,
--   hint_enable = false,
--   floating_window_above_cur_line = false,
-- }

-- Setup neovim lua configuration
require("neodev").setup()
--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Setup mason so it can manage external tooling
require("mason").setup({
    ui = { border = "rounded" },
})

local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    }),
}

local on_attach = function(client, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = "LSP: " .. desc
        end
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })

        local opts = { buffer = ev.buf }
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
end

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            handlers = handlers,
        })
    end,
})

-- Add border on LspInfo command
require("lspconfig.ui.windows").default_options.border = "single"

-- special case not using mason due to anomali if using multiple environment
local lspconfig = require("lspconfig")
lspconfig.jedi_language_server.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
    init_options = {
        completion = {
            disableSnippets = true,
        },
    }
})
lspconfig.ruff_lsp.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
    init_options = {
        settings = {
            args = {
                "--extend-select=W,COM,ICN",
                "--ignore=E501,E722,COM812",
            },
        },
    },
})

vim.diagnostic.config({
    underline = true,
    virtual_text = false,
    float = {
        focusable = true,
        style = "minimal",
        source = "always",
        header = "",
        prefix = "",
    },
    update_in_insert = false,
    severity_sort = true,
})



vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)


vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
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
    end,
})
