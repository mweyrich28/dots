function ColorMyPencils(color)
    -- color = color or "catppuccin"
    color = color or "gruvbox"
    -- color = color or "melange"
    -- color = color or "nordic"
    -- color = color or "tokyonight"
    vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
end

ColorMyPencils()


-- Load the colorscheme
-- require('nord').set()

