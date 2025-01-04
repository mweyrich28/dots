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
