
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
		path = '~/documents/zettelkasten/',
		syntax = 'markdown',
		ext = '.md',
        index = 'README'
	},
	{
		path = '~/documents/backup_wiki/',
		syntax = 'markdown',
		ext = '.md',
        index = 'README'
	}
}

vim.cmd([[highlight Underlined gui=underline guifg=#8FBCBB]])

-- nordic
-- vim.cmd([[hi VimwikiHeader1 guifg=#E7C173]])
-- vim.cmd([[hi VimwikiHeader2 guifg=#E7C173]])
-- vim.cmd([[hi VimwikiHeader3 guifg=#E7C173]])
-- vim.cmd([[hi VimwikiHeader4 guifg=#E7C173]])
-- vim.cmd([[hi VimwikiHeader5 guifg=#E7C173]])
-- vim.cmd([[hi VimwikiHeader6 guifg=#E7C173]])
-- vim.cmd([[highlight Underlined gui=underline guifg=#8FBCBB]])

-- gruvbox #fb4934
-- vim.cmd([[hi VimwikiHeader1 guifg=#fb4934]])
-- vim.cmd([[hi VimwikiHeader2 guifg=#fb4934]])
-- vim.cmd([[hi VimwikiHeader3 guifg=#fb4934]])
-- vim.cmd([[hi VimwikiHeader4 guifg=#fb4934]])
-- vim.cmd([[hi VimwikiHeader5 guifg=#fb4934]])
-- vim.cmd([[hi VimwikiHeader6 guifg=#fb4934]])

-- vim.cmd([[hi VimwikiHeader1 guifg=#5E81AC]])
-- vim.cmd([[hi VimwikiHeader2 guifg=#5E81AC]])
-- vim.cmd([[hi VimwikiHeader3 guifg=#5E81AC]])
-- vim.cmd([[hi VimwikiHeader4 guifg=#5E81AC]])
-- vim.cmd([[hi VimwikiHeader5 guifg=#5E81AC]])
-- vim.cmd([[hi VimwikiHeader6 guifg=#5E81AC]])

vim.cmd([[hi VimwikiHeader1 guifg=#CB775D]])
vim.cmd([[hi VimwikiHeader2 guifg=#CB775D]])
vim.cmd([[hi VimwikiHeader3 guifg=#CB775D]])
vim.cmd([[hi VimwikiHeader4 guifg=#CB775D]])
vim.cmd([[hi VimwikiHeader5 guifg=#CB775D]])
vim.cmd([[hi VimwikiHeader6 guifg=#CB775D]])

-- #fe8019
-- vim.cmd([[hi VimwikiHeader1 guifg=#fe8019]])
-- vim.cmd([[hi VimwikiHeader2 guifg=#fe8019]])
-- vim.cmd([[hi VimwikiHeader3 guifg=#fe8019]])
-- vim.cmd([[hi VimwikiHeader4 guifg=#fe8019]])
-- vim.cmd([[hi VimwikiHeader5 guifg=#fe8019]])
-- vim.cmd([[hi VimwikiHeader6 guifg=#fe8019]])
