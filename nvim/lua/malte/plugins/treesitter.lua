return {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        require 'nvim-treesitter'.setup {
            ensure_installed = { "lua", "vim", "vimdoc", "query", "python", "cpp" },

            sync_install = false,

            auto_install = true,

            ignore_install = { "javascript" },

            highlight = {
                enable = true,
                disable = { "rust", "latex" },
                additional_vim_regex_highlighting = false,
            },
        }
    end,
}

