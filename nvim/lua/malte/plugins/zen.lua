return {
    "folke/zen-mode.nvim",
    config = function()
        require("zen-mode").setup({
            window = {
                backdrop = 1,
                width = 120,
                options = {
                    signcolumn = "no",
                    number = true,
                    relativenumber = true,
                    cursorline = false,
                    cursorcolumn = false,
                    foldcolumn = "0",
                    list = false,
                },
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = false,
                    showcmd = false,
                    laststatus = 0,
                },
                twilight = { enabled = false },
                gitsigns = { enabled = false },
                tmux = { enabled = false },
            },
        })

        -- Override the backdrop highlight to match your normal background
        vim.api.nvim_set_hl(0, "ZenBg", { link = "Normal" })
    end,
}
