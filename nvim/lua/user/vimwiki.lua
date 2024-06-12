
vim.g.vimwiki_conceallevel = 2
vim.g.vimwiki_conceal_pre = 1
-- vim.g.vimwiki_listing_hl = 0
-- vim.g.vimwiki_hl_cb_checked = 2

vim.g.vimwiki_auto_chdir = 1
vim.g.vimwiki_key_mappings = { headers=0 }
vim.g.vimwiki_global_ext = 0
-- vim.g.vimwiki_folding = 'syntax'

vim.g.vimwiki_list = {
	{
		path = '~/documents/vimwiki_para/',
		syntax = 'markdown',
		ext = '.md',
        index = 'README'
	},
	{
		path = '~/documents/vimwiki_para/1.Projects/Sponge_Pipeline/',
		syntax = 'markdown',
		ext = '.md',
        index = 'README'
	}
}

vim.cmd([[hi VimwikiHeader1 guifg=#E7C173]])
vim.cmd([[hi VimwikiHeader2 guifg=#E7C173]])
vim.cmd([[hi VimwikiHeader3 guifg=#E7C173]])
vim.cmd([[hi VimwikiHeader4 guifg=#E7C173]])
vim.cmd([[hi VimwikiHeader5 guifg=#E7C173]])
vim.cmd([[hi VimwikiHeader6 guifg=#E7C173]])
vim.cmd([[highlight Underlined gui=underline guifg=#8FBCBB]])

