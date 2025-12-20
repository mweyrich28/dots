function ColorMyPencils(color)
    -- color = color or "catppuccin-mocha"
    -- color = color or "everforest"
    -- color = color or "melange"
    -- color = color or "kanagawa"
    -- color = color or "nordic"
    -- color = color or "tokyonight"
    color = color or "rose-pine-moon"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()


-- dynamically matching bg of virtual_text to current theme bg
local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg or "NONE"
for _, group in ipairs({ "Error", "Warn", "Info", "Hint" }) do
  vim.api.nvim_set_hl(0, "DiagnosticVirtualText" .. group, {
    bg = normal_bg,
    fg = vim.api.nvim_get_hl(0, { name = "Diagnostic" .. group }).fg or "NONE"
  })
end


-- vimwiki colors
vim.cmd([[
    highlight VimwikiHeader1 guifg=#f4a685
    highlight VimwikiHeader2 guifg=#f4a685
    highlight VimwikiHeader3 guifg=#f4a685
    highlight VimwikiHeader4 guifg=#f4a685
    highlight VimwikiHeader5 guifg=#f4a685
    highlight VimwikiHeader6 guifg=#f4a685
    " highlight VimwikiCode guifg=#d7827e guibg=#191724
    highlight VimwikiCode guifg=#d7827e
    highlight VimwikiLink gui=underline guifg=#8FBCBB
]])
