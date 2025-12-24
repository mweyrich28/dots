return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown", "vimwiki" },
    build = function() vim.fn["mkdp#util#install"]() end,
    init = function()  -- init is correct here for vim.g settings
        vim.g.mkdp_theme = 'dark'
        vim.g.mkdp_page_title = '[${name}]'
        vim.g.mkdp_auto_close = 0
        vim.g.mkdp_markdown_css = '/home/malte/.config/markdown.css'
        vim.g.mkdp_combine_preview = 1
        vim.g.mkdp_filetypes = { "markdown", "vimwiki" }
    end,
}
