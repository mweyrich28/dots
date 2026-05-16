return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local install_dir = vim.fn.stdpath('data') .. '/site'
    vim.opt.rtp:prepend(install_dir)
    require('nvim-treesitter').setup({
      install_dir = install_dir,
    })
  end,
}
