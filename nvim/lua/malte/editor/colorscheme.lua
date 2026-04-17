function ColorMyPencils(color)
    -- color = color or "catppuccin-mocha"
    -- color = color or "everforest"
    -- color = color or "melange"
    -- color = color or "kanagawa"
    -- color = color or "nordic"
    -- color = color or "tokyonight"
    -- color = color or "rose-pine-moon"
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
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
-- header
-- #d78787
-- #f4a685
-- #FFAF87
--
--link
--#8FBCBB
--
--code
--#DE9979
--#FFAFAF
--#d7827e
vim.cmd([[
    highlight VimwikiHeader1 guifg=#FFAF87
    highlight VimwikiHeader2 guifg=#FFAF87
    highlight VimwikiHeader3 guifg=#FFAF87
    highlight VimwikiHeader4 guifg=#FFAF87
    highlight VimwikiHeader5 guifg=#FFAF87
    highlight VimwikiHeader6 guifg=#FFAF87
    highlight VimwikiCode guifg=#FFAFAF
    highlight VimwikiLink gui=underline guifg=#5C8283
]])


-- Make Telescope match your theme
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })

-- Telescope-specific (stronger override)
vim.api.nvim_set_hl(0, "TelescopeNormal", { link = "NormalFloat" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "FloatBorder" })
