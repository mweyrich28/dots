local headlines = require("headlines")
            headlines.setup({
                vimwiki = vim.tbl_extend(
                    "force",
                    { treesitter_language = "markdown" },
                    headlines.config.markdown
                )
            })
