return {
    "SirVer/ultisnips",
    init = function()
        vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
        vim.g.UltiSnipsJumpForwardTrigger = '<c-j>'
        vim.g.UltiSnipsJumpBackwardTrigger = '<c-k>'
        vim.g.snips_author = 'Malte Weyrich'
    end,
}
