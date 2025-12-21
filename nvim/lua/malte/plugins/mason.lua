return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },

    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "pyright", "gopls", "clangd", "r_language_server" },
        })
        require('mason-tool-installer').setup {
            -- start
            ensure_installed = {
                'black',
                'debugpy',
                'flake8',
                'isort',
                'pylint'
            },
            auto_update = false,
            run_on_start = true,
            start_delay = 3000, -- 3 second delay
            debounce_hours = 5, -- at least 5 hours between attempts to install/update
            integrations = {
                ["mason-lspconfig"] = true,
                ["mason-null-ls"] = true,
                ["mason-nvim-dap"] = true,
            }
        }
    end,
}
