local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end
--
-- -- require("luasnip/loaders/from_vscode").lazy_load()
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
require("cmp_nvim_ultisnips").setup {}


local kind_icons = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = " ",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = " ",
    Misc = " ",
}

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
        {
            name = 'buffer',
            option = {
                keyword_pattern = [[\k\+]],
            }
        },
        {
            name = "latex_symbols",
            option = {
                strategy = 0, -- mixed
            },
        },
        {
            name = 'tmux',
            option = {
                -- Source from all panes in session instead of adjacent panes
                all_panes = false,

                -- Completion popup label
                label = '',

                -- Trigger character
                trigger_characters = { '.' },

                -- Specify trigger characters for filetype(s)
                -- { filetype = { '.' } }
                trigger_characters_ft = {},

                -- Keyword patch mattern
                keyword_pattern = [[\w\+]],

                -- Capture full pane history
                -- `false`: show completion suggestion from text in the visible pane (default)
                -- `true`: show completion suggestion from text starting from the beginning of the pane history.
                --         This works by passing `-S -` flag to `tmux capture-pane` command. See `man tmux` for details.
                capture_history = false,
            }
        },
    }),
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
            -- Customize the way it is displayed
            vim_item.kind = string.format("%s", vim_item.kind)
            vim_item.menu = ({
                ultisnips = "[SNIP]",
                buffer    = "[BUF]",
                nvim_lsp  = "[LSP]",
                tmux      = "[TMUX]",
                path      = "[PATH]",
            })[entry.source.name]
            return vim_item
        end,

        expandable_indicator = false,
    },

})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]] --

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})
