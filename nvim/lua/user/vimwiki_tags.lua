local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local Job = require('plenary.job')


local function split(str)
    local parts = {}
    for part in string.gmatch(str, "/") do
        table.insert(parts, part)
    end
    return parts
end

local function get_depth(path)
    local path_table = split(path)
    local depth = 0
    for _, _ in ipairs(path_table) do
        depth = depth + 1
    end
    return depth
end

function GetTag(file_name)
    local vault_path = vim.g.vimwiki_list[1].path
    local current_file_path = vim.fn.expand("%:p")
    -- tag dir
    local tag_dir = "3_tags/"

    local curr_depht = get_depth(current_file_path)
    local vault_depth = get_depth(vault_path)

    -- Count the number of directories to go up
    local relative_path = ""
    for i=3, curr_depht - vault_depth,1 do
        relative_path = relative_path .. "../"
    end

    -- Append the path to the markdown file
    relative_path = relative_path .. tag_dir .. file_name
    local wiki_link = "[".. string.gsub(file_name, ".md", "") .."]" .. "(" .. relative_path .. ")"

    return wiki_link
end

local function generate_new_tag(tag_name)
    Job:new({
        command = "/home/malte/.config/scripts/vimwiki_link.sh",
    args = { "/home/malte/documents/zettelkasten/3_tags/" .. tag_name, tag_name},
    }):start()
end

local function select_tag()
    local opts = require("telescope.themes").get_dropdown { prompt_title = "Tags" }
    -- TODO rewrite
    local results = vim.fn.systemlist("ls /home/malte/documents/zettelkasten/3_tags/")

    pickers.new(opts, {
        finder = finders.new_table({
            results = results
        }),
        sorter = conf.file_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)

                -- press ctrl enter to generate new tag
                map('i', '<A-CR>', function()
                    local new_tag_name = action_state.get_current_line()
                    actions.close(prompt_bufnr)
                    generate_new_tag(new_tag_name)
                    local tag_link = GetTag(new_tag_name)
                    vim.api.nvim_put({ tag_link }, "", true, true)
                end)

                -- or link to already existing tag
                map('i', '<CR>', function()
                    local selection = action_state.get_selected_entry()
                    if selection then
                        actions.close(prompt_bufnr)
                        
                        local tag_name = selection.value
                        local tag_link = GetTag(tag_name)
                        
                        vim.api.nvim_put({ tag_link }, "", true, true)
                    end
                end)
            
            return true
        end
    }):find()
end

return {
    select_tag = select_tag,
}
