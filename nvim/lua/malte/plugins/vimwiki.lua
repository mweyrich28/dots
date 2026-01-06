return {
    'vimwiki/vimwiki',
    ft = 'vimwiki',
    dependencies = { 'lervag/vimtex' },  -- This ensures vimtex loads first
    init = function()
        vim.g.vimwiki_list = {
            {
                path = '~/documents/zettelkasten/',
                index = 'README',
                syntax = 'markdown',
                ext = '.md',
            },
            {
                path = '~/documents/project_wiki/',
                syntax = 'markdown',
                ext = '.md',
                index = 'README'
            },
        }
        vim.g.vimwiki_conceallevel = 2
        vim.g.vimwiki_conceal_pre = 1
        vim.g.vimwiki_hl_cb_checked = 2
        vim.g.vimwiki_auto_chdir = 1
        vim.g.vimwiki_key_mappings = { headers = 0 }
        -- vim.g.vimwiki_global_ext = 0
        vim.g.tex_conceal = 'abdmgs'
    end,
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "vimwiki",
            callback = function()
                vim.opt_local.conceallevel = 2
                vim.opt_local.concealcursor = ""
                -- load tex syntax since it is somehow broken...
                vim.cmd([[
                    syntax clear textSnipTEX
                    runtime! syntax/tex.vim
                    syntax region textSnipTEX matchgroup=Snip start='\$' end='\$' contains=@texClusterMath concealends keepend
                    syntax region textSnipTEX matchgroup=Snip start='\$\$' end='\$\$' contains=@texClusterMath concealends keepend
                ]])
            end,
        })
    end,
}
