function EditImage()
    -- grab content under curser
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_win_get_buf(win)
    local cursor = vim.api.nvim_win_get_cursor(win)
    local line_number = cursor[1]
    local line_content = vim.api.nvim_buf_get_lines(buf, line_number - 1, line_number, false)[1]
    local link_content = line_content:match("%((.-)%)")
    link_content = link_content:gsub("%.%.%/.-%/", "")
    link_content = vim.g.vimwiki_list[1].path .. link_content
    link_content = link_content:gsub("~", "/home/malte")
    vim.fn.system("/snap/bin/kolourpaint " .. link_content)
end
