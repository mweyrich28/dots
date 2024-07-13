vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

-- black
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      pattern = "*.py",
      callback = function()
        vim.cmd("Black")
      end,
    })


-- isort
vim.g.vim_isort_map = ''
-- Automatically format file buffer when saving
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = "*.py",
  callback = function()
    vim.cmd("Isort")
  end,
})

