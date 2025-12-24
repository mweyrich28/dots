return {
    "numToStr/Comment.nvim",
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
        require('Comment').setup({
            toggler = {
                line = '<leader>/',
                --[[ block = '<leader>/', ]]
            },
            opleader = {
                line = '<leader>/',
                --[[ block = '<leader>/', ]]
            },
        })
    end,
}
