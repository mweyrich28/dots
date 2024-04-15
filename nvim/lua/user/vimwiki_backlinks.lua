local telescope = require("telescope.builtin")

local function search_backlinks()
    local current_file = vim.fn.expand('%:t')
    -- Remove .* extension
    current_file = current_file:gsub(".md", "")
    local search_pattern = "\\[*\\]\\(.*" .. current_file .. "[.md\\)|\\)]"

    telescope.live_grep({
        prompt_title = "Wiki Backlinks",
        default_text = search_pattern,
        no_ignore = true,
        hidden = true,
    })
end


return {
    search_backlinks = search_backlinks,
}

