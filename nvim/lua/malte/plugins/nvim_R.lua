return {
    enabled = true,
    "R-nvim/R.nvim",
    ft = "r",
    config = function()
        ---@type RConfigUserOpts
        local opts = {
            R_args = {"--quiet", "--no-save"},
            disable_cmds = {
                "RClearConsole",
                "RCustomStart",
                "RSPlot",
                "RSaveClose",
            },
        }
        require("r").setup(opts)
    end
}
