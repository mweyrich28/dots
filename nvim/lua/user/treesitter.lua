require'nvim-treesitter'.setup {
  ensure_installed = { "lua", "vim", "vimdoc", "query", "python", "cpp", "r", "markdown", "rnoweb", "yaml" },
  ignore_install = { "javascript" },

  highlight = {
    disable = { "rust", "latex" },
    additional_vim_regex_highlighting = false,
    enable = true,
  },
}
