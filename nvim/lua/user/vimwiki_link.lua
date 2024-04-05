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


local function executeJob(wiki_path)
    -- Dump header into new file 
    Job:new({
        command = "/home/malte/.config/scripts/vimwiki_link.sh",
        args = { wiki_path },
    }):start()
end

function LinkVaultWiki(link_to_file_rel)
    local markdown_name = link_to_file_rel.match(link_to_file_rel, "[^/]+$")

    local current_file_path = vim.fn.expand("%:p")
    local rel_path = string.match(current_file_path, ".*/vimwiki_para/(.*)")

    -- check if curr_file has the same path as the current_file_path
    -- remove the last part of the path (the .md part)
    local link_to = link_to_file_rel.match(link_to_file_rel, "(.*/)")
    local call_from = current_file_path.match(rel_path, "(.*/)")
    if link_to == call_from then
        local wiki_link = "[" .. string.gsub(markdown_name, ".md", "") .. "]" .. "(" .. markdown_name .. ")"
        return wiki_link
    end

    local root_depth = 5 -- this should be the 'depth' of your main vimwiki folder 
    local current_file_path_table = Split(current_file_path)
    local relative_path = ""

    local curr_depht = 0
    for _, _ in ipairs(current_file_path_table) do
        curr_depht = curr_depht + 1
    end

    -- Count the number of directories to go up
    for i=1, curr_depht - root_depth,1 do
        relative_path = relative_path .. "../"
    end

    -- Append the path to the markdown file
    relative_path = relative_path .. link_to_file_rel
    local wiki_link = "[" .. string.gsub(markdown_name, ".md", "") .. "]" .. "(" .. relative_path .. ")"
    return wiki_link
end


function CreateNewWiki(curr_file)
    local markdown_name = curr_file.match(curr_file, "[^/]+$")

    local current_dir = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":h")
    local wiki_link = "[" .. markdown_name .. "]" .. "(" .. curr_file .. ".md)"
    local wiki_md = current_dir .. "/" .. curr_file
    executeJob(wiki_md)
    return wiki_link
end

local vimwiki_link = function()
    local opts = require("telescope.themes").get_dropdown { prompt_title = "Vimwiki Link" }

    local results = vim.fn.systemlist("find /home/malte/documents/vimwiki_para -type f -name '*.md'")
    local processed_results = {}
    for _, path in ipairs(results) do
        local markdown_file = string.match(path, ".*/vimwiki_para/(.*)")
        if markdown_file then
            table.insert(processed_results, markdown_file)
        end
    end

    pickers.new(opts, {
        finder = finders.new_table({
            results = processed_results
        }),
        sorter = conf.file_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)

                -- if there is no selection, just take the string which is entered in the prompt
                local rel_wiki_path = ""
                local wiki_link = ""
                if not selection then
                    rel_wiki_path = action_state.get_current_line()
                    wiki_link = CreateNewWiki(rel_wiki_path)
                else
                    rel_wiki_path = selection.value
                    wiki_link = LinkVaultWiki(rel_wiki_path)
                end


                vim.api.nvim_put({ wiki_link }, "", true, true)
            end)

            return true
        end
    }):find()
end

return {
    vimwiki_link = vimwiki_link
}
