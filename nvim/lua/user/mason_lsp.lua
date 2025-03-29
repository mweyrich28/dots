require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "codelldb", "clang-format", "pyright", "bash-language-server", "black", "clangd", "debugpy", "flake8", "isort", "lua-language-server", "pylint", "r-languageserver", "texlab" },
}
