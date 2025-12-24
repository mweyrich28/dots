return {
    "SirVer/ultisnips",
    priority = 4,
    init = function()
        vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
        vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
        vim.g.UltiSnipsExpandTrigger = '<tab>'
        vim.g.snips_author = 'Malte Weyrich'

        vim.g.UltiSnipsFiletypeExtensions = {
            vimwiki = { "markdown_inline", "markdown" },
        }
    end,

}
