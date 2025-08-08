local original_write = vim.api.nvim_out_write
vim.api.nvim_out_write = function(_) end

vim.cmd([[silent! call firenvim#install(0)]])

vim.api.nvim_out_write = original_write


vim.g.firenvim_config = {
  localSettings = {
['https://teams.microsoft.com/*'] = {
      takeover = 'never',
    },
 ['https://chat.openai.com/*'] = {
      takeover = 'always',
      selector = 'div[role="textbox"]',
    },
    ['.*'] = {
      takeover = 'always',
      selector = 'textarea:not([readonly], [aria-readonly]), div[role="textbox"]',
    },
  }
}
