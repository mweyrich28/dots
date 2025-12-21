return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            -- completion sources
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",

            -- UltiSnips
            "SirVer/ultisnips",
            "quangnguyen30192/cmp-nvim-ultisnips",

            -- extras you use
            "micangl/cmp-vimtex",
            "kdheepak/cmp-latex-symbols",
            "andersevenrud/cmp-tmux",
        },
        config = function()
            local cmp_status_ok, cmp = pcall(require, "cmp")
            if not cmp_status_ok then
                return
            end
            local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
            require("cmp_nvim_ultisnips").setup {}

            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    end,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping(
                        function(fallback)
                            cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
                        end,
                        { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
                    ),
                    ["<S-Tab>"] = cmp.mapping(
                        function(fallback)
                            cmp_ultisnips_mappings.jump_backwards(fallback)
                        end,
                        { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
                    ),
                    -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    -- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = 'ultisnips' }, -- For ultisnips users.
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = 'vimtex', },
                    {
                        name = 'buffer',
                        option = {
                            keyword_pattern = [[\k\+]],
                        }
                    },
                    {
                        name = "latex_symbols",
                        option = {
                            strategy = 2, -- mixed
                        },
                    },
                    {
                        name = 'tmux',
                        option = {
                            all_panes = false,

                            label = '',

                            trigger_characters = { '.' },

                            trigger_characters_ft = {},

                            -- Keyword patch mattern
                            keyword_pattern = [[\w\+]],

                            capture_history = false,
                        }
                    },
                }),
                formatting = {
                    fields = { "abbr", "kind", "menu" },
                    format = function(entry, vim_item)
                        vim_item.kind = string.format("%s", vim_item.kind)
                        vim_item.menu = ({
                            ultisnips = "[SNIP]",
                            nvim_lsp  = "[LSP]",
                            buffer    = "[BUF]",
                            vimtex    = "[TEX]",
                            path      = "[PATH]",
                            -- latex_symbols = "[LTEX]",
                            tmux      = "[TMUX]",
                        })[entry.source.name]
                        return vim_item
                    end,

                    expandable_indicator = false,
                },

            })

            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                }),
                matching = { disallow_symbol_nonprefix_matching = false }
            })
        end,
    },
}
