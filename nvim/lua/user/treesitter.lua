require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "vim", "vimdoc", "query", "python", "cpp" },

  sync_install = false,

  auto_install = true,

  ignore_install = { "javascript" },

  highlight = {
    disable = { "rust", "latex" },
    additional_vim_regex_highlighting = false,
    enable = true,
  },
}
