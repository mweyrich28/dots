-- local telescope = require("telescope.builtin")
--
-- local function search_backlinks()
--     local current_file = vim.fn.expand('%:t')
--     -- Remove .* extension
--     current_file = current_file:gsub(".md", "")
--     local search_pattern = "\\[*\\]\\(.*" .. current_file .. "[.md\\)|\\)]"
--
--     telescope.live_grep({
--         prompt_title = "Wiki Backlinks",
--         default_text = search_pattern,
--         no_ignore = true,
--         hidden = true,
--     })
--
--
-- end
--
--
-- return {
--     search_backlinks = search_backlinks,
-- }

local actions = require("telescope.actions")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values


local function generate_index(search_pattern)
    local results = vim.fn.systemlist("rg --vimgrep " .. vim.fn.shellescape(search_pattern))
    local index = "# Index"
    vim.api.nvim_put({ index }, "l", true, true)
    for _, result in ipairs(results) do
        local file_path = string.gsub(result, ":.*", "") -- get path like 4_atomic_notes/MARKDOWN.md
        local file_name = string.gsub(file_path, ".*/", "")
        local wiki_link = "- [" .. file_name .. "]" .. "(../" .. file_path .. ")"
        vim.api.nvim_put({ wiki_link }, "l", true, true)

    end

end

local function search_backlinks()
    local current_file = vim.fn.expand('%:t')
    -- Remove .* extension
    current_file = current_file:gsub(".md", "")
    local search_pattern = "\\[*\\]\\(.*" .. current_file .. "[.md\\)|\\)]"

    -- Use Telescope's live_grep to search for backlinks
    pickers.new({}, {
        prompt_title = "VimwikiBacklinks",
        finder = finders.new_oneshot_job({"rg", "--vimgrep", search_pattern}, {}),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            -- press ctrl enter to generate new tag
            map('i', '<A-CR>', function()
                actions.close(prompt_bufnr)
                generate_index(search_pattern)
            end)

            actions.select_default:replace(function()
                actions.file_edit(prompt_bufnr)
            end)

            return true
        end,
    }):find()

end

return {
    search_backlinks = search_backlinks,
}
