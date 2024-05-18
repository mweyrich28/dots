require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "vim", "vimdoc", "query", "python" },

  sync_install = false,

  auto_install = true,

  ignore_install = { "javascript" },

  highlight = {
    enable = true,
    disable = { "c", "rust", "latex" },
    additional_vim_regex_highlighting = false,
  },
}
