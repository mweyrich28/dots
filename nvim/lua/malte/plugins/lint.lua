return {
    'mfussenegger/nvim-lint',
    config = function()
        require('lint').linters_by_ft = {
            python = {
                'flake8',
                'pylint',
            }
        }

        -- Automatically run linters after saving.  Use "InsertLeave" for more aggressive linting.
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            -- Only run linter for the following extensions. Remove this to always run.
            pattern = { "*.py", },
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
