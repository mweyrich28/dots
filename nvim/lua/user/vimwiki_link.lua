local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local Job = require('plenary.job')

function Split(str)
    local parts = {}
    for part in string.gmatch(str, "/") do
        table.insert(parts, part)
    end
    return parts
end

local function get_depth(path)
    local path_table = Split(path)
    local depth = 0
    for _, _ in ipairs(path_table) do
        depth = depth + 1
    end
    return depth
end


local function executeJob(wiki_path, markdown_name)
    -- Dump header into new file 
    Job:new({
        command = "/home/malte/.config/scripts/vimwiki_link.sh",
        args = { wiki_path, markdown_name },
    }):start()
end

function LinkVaultWiki(link_to_file_rel)
    local markdown_name = link_to_file_rel.match(link_to_file_rel, "[^/]+$")

    local vault_path = vim.g.vimwiki_list[1].path
    local current_file_path = vim.fn.expand("%:p")
    local rel_path = string.match(current_file_path, ".*/zettelkasten/(.*)")

    -- check if curr_file has the same path as the current_file_path, return simple link
    -- remove the last part of the path (the .md part)
    local link_to = link_to_file_rel.match(link_to_file_rel, "(.*/)")
    local call_from = current_file_path.match(rel_path, "(.*/)")
    local formatted_name = string.gsub(markdown_name, ".md", "")
    formatted_name = string.gsub(formatted_name, "_", " ")
    if link_to == call_from then
        local wiki_link = "[" .. formatted_name .. "]" .. "(" .. markdown_name .. ")"
        return wiki_link
    end


    local curr_depht = get_depth(current_file_path)
    local vault_depth = get_depth(vault_path)

    -- Count the number of directories to go up
    local relative_path = ""
    for i=3, curr_depht - vault_depth,1 do
        relative_path = relative_path .. "../"
    end

    -- Append the path to the markdown file
    relative_path = relative_path .. link_to_file_rel
    local formatted_name = string.gsub(markdown_name, "%.md$", "")
    formatted_name = string.gsub(formatted_name, "_", " ")
    local wiki_link = "[" .. formatted_name .. "]" .. "(" .. relative_path .. ")"
    return wiki_link
end


function CreateNewWiki(curr_file)
    local markdown_name = curr_file.match(curr_file, "[^/]+$")

    local current_dir = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":h")
    local wiki_link = "[" .. string.gsub(markdown_name, "_", " ") .. "]" .. "(" .. curr_file .. ".md)"
    local wiki_md = current_dir .. "/" .. curr_file
    executeJob(wiki_md, markdown_name)
    return wiki_link
end

local vimwiki_link = function()
    local opts = require("telescope.themes").get_dropdown { prompt_title = "Vimwiki Link" }

    local results = vim.fn.systemlist("find /home/malte/documents/zettelkasten/ -type f -name '*.md'")
    local processed_results = {}
    for _, path in ipairs(results) do
        local markdown_file = string.match(path, ".*/zettelkasten/(.*)")
        if markdown_file then
            table.insert(processed_results, markdown_file)
        end
    end

    local rel_wiki_path = ""
    local wiki_link = ""

    pickers.new(opts, {
        finder = finders.new_table({
            results = processed_results
        }),
        sorter = conf.file_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                rel_wiki_path = selection.value
                wiki_link = LinkVaultWiki(rel_wiki_path)

                vim.api.nvim_put({ wiki_link }, "", true, true)
            end)

            map('i', '<A-CR>', function()
                actions.close(prompt_bufnr)
                rel_wiki_path = action_state.get_current_line()
                wiki_link = CreateNewWiki(rel_wiki_path)
                
                vim.api.nvim_put({ wiki_link }, "", true, true)
            end)

            return true
        end
    }):find()
end

return {
    vimwiki_link = vimwiki_link
}
