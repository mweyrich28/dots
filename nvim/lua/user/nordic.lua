require('nordic').load {
    cursorline = {
        theme = 'dark',
    },
}

require('lualine').setup {
    options = { theme = 'nordic' },
}

require('nordic').setup({
    on_palette = function(palette) end,
    after_palette = function(palette) end,
    on_highlight = function(highlights, palette) end,
    bold_keywords = false,
    italic_comments = true,
    transparent = {
        bg = false,
        float = false,
    },
    -- Enable brighter float border.
    bright_border = true,
    reduced_blue = true,
    -- Swap the dark background with the normal one.
    swap_backgrounds = false,
    cursorline = {
        bold = false,
        bold_number = true,
        theme = 'dark',
        blend = 0.85,
    },
    noice = {
        style = 'classic',
    },
    telescope = {
        style = 'flat',
    },
    leap = {
        -- Dims the backdrop when using leap.
        dim_backdrop = false,
    },
    ts_context = {
        -- Enables dark background for treesitter-context window
        dark_background = true,
    }
})
