vim.g.vimwiki_conceallevel = 2
vim.g.vimwiki_conceal_pre = 1
vim.g.vimwiki_hl_cb_checked = 2

vim.g.vimwiki_auto_chdir = 1
vim.g.vimwiki_key_mappings = { headers=0 }

vim.g.vimwiki_list = {
    {
        path = '~/documents/zettelkasten/',
        syntax = 'markdown',
        ext = '.md',
        index = 'README'
    },
    {
        path = '~/documents/project_wiki/',
        syntax = 'markdown',
        ext = '.md',
        index = 'README'
    },
}

require 'malte.core.lazy'
require 'malte.editor.colorscheme'
