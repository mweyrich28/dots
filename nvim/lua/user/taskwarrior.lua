require("taskwarrior_nvim").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
})

-- task
vim.keymap.set("n", "<leader>tb", function()
	require("taskwarrior_nvim").browser({ "ready" })
end)

vim.keymap.set("n", "<leader>ta", function()
	require("taskwarrior_nvim").project()
end)
