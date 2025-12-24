return {
    priority = 8,
    "kyazdani42/nvim-tree.lua",
    config = function()
        -- disable netrw at the very start of your init.lua (strongly advised)
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1


        require("nvim-tree").setup({
            sort_by = "case_sensitive",
            view = {
                width = 30,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = false,
            },
        })

        -- Show hidden Files: H
        -- Show .gitignore: I
        -- Show help: g?
        -- Open Sytem File Manager: s
    end,
}
