-- use this table to enable/disable filetypes
-- vim.g.copilot_filetypes = {xml = false}
-- config for only python:
-- vim.g.copilot_filetypes = {["*"] = false}

-- contr-[ →  cycle through suggestions 
-- contr-] →  dismiss

-- vim.api.nvim_set_keymap("i", "<C-a>", ":copilot#Accept('\\<CR>')<CR>", { silent = true })
vim.cmd[[imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")]]
vim.cmd[[let g:copilot_no_tab_map = v:true]]
vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]
vim.g.copilot_enabled = 0
