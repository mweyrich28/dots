local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

-- require("luasnip/loaders/from_vscode").lazy_load()
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
    Misc = " "
    ,
}


cmp.setup({

    snippet = {
        --expand = function(args)
        --    luasnip.lsp_expand(args.body) -- For `luasnip` users.
        --end,
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },

    mapping = {
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
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    },

    formatting = {
        fields = { "abbr", "menu" },
        format = function(entry, vim_item)
            vim_item.kind = kind_icons[vim_item.kind]
            vim_item.menu = ({
                ultisnips = "[Snip]",
                buffer = "[Buf]",
                nvim_lsp = "[LSP]",
                cmdline = "[Cmd]",
                path = "[Path]",
                vimwiki_tags= "[Tag]"
                -- fuzzy_buffer = "[Fuzzy]",
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = 'vimwiki-tags' },
        { name = "path" },
        { name = "async_path" },
        { name = "buffer" },
        { name = "ultisnips" },
        { name = "calc" },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
        winhighlight = "Normal:CmpNormal",
    },
    experimental = {
        ghost_text = false,
    },
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        {
            name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', '!' }
            }
        }
    })
})

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})
