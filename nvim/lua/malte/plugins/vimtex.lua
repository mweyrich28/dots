return {
    'lervag/vimtex',
    ft = { 'tex', 'latex', 'markdown', 'vimwiki' },
    init = function()
        vim.g.tex_comment_nospell = 1
        vim.g.vimtex_quickfix_ignore_filters = {
            'Underfull',
            'Overfull',
            'Negative',
            'Font',
            'FontWarning',
        }
        vim.g.tex_conceal = 'abdmgs'
        vim.g.vimtex_view_method = 'zathura'
        vim.g.vimtex_compiler_latexmk_engines = { _ = '-pdf' }
        vim.g.vimtex_compiler_latexmk = {
            options = {
                "-pdf",
                "-verbose",
                "-file-line-error",
                "-synctex=1",
                "-interaction=nonstopmode",
            },
            continuous = 1
        }
    end
}
