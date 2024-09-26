require('nordic').load {
    cursorline = {
        theme = 'dark',
    },
}

require('lualine').setup {
    options = { theme = 'nordic' },
}

require 'nordic' .setup {
    on_palette = function(palette) return palette end,
    bold_keywords = false,
    italic_comments = true,
    transparent = false,
    bright_border = false,
    reduced_blue = true,
    swap_backgrounds = false,
    on_highlight = {},
    cursorline = {
        bold = true,
        bold_number = true,
        theme = 'dark',
        blend = 0.85,
    },
    noice = {
        style = 'classic',
    },
    telescope = {
        style = 'classic',
    },
    leap = {
        dim_backdrop = false,
    },
    ts_context = {
        dark_background = true,
    }
}
