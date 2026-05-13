return {
    "SirVer/ultisnips",
    init = function()
        vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
        vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
        vim.g.UltiSnipsExpandTrigger = '<NUL>'   -- ← disable it; cmp owns <Tab>
        vim.g.snips_author = 'Malte Weyrich'
    end,
}
