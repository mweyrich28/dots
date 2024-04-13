local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local function search_backlinks()
    local current_file = vim.fn.expand('%:t')
    -- Remove .* extension
    current_file = current_file:gsub(".md", "")
    local search_pattern = "'\\[*\\]\\(.*" .. current_file .. "[.md\\)|\\)']"

    local opts = require("telescope.themes").get_dropdown { prompt_title = "Vimwiki Backink" }
    local results = vim.fn.systemlist("rg " .. search_pattern)
    pickers.new(opts, {
        finder = finders.new_table({
            results = results
        }),
        sorter = conf.file_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                vim.cmd("edit " .. selection.value) -- Open the selected file
                actions.close(prompt_bufnr)
            end)
            return true
        end
    }):find()
end


return {
    search_backlinks = search_backlinks,
}
