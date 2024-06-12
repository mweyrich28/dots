local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"


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

function CreateAtomicLink(file_name)
    local vault_path = vim.g.vimwiki_list[1].path
    local current_file_path = vim.fn.expand("%:p")
    -- dir where you store your goodnotes
    local pdf_dir = "assets/AtomicNotes/"

    local curr_depht = get_depth(current_file_path)
    local vault_depth = get_depth(vault_path)

    -- Count the number of directories to go up
    local relative_path = ""
    for i=3, curr_depht - vault_depth,1 do
        relative_path = relative_path .. "../"
    end

    -- Append the path to the markdown file
    relative_path = relative_path .. pdf_dir .. file_name
    -- return a two links (second one for github markdown to correctly identify the pdf link)
    local wiki_link = "[".. string.gsub(file_name, ".pdf", "") .."]" .. "(local:" .. relative_path .. "): " .. "[".. string.gsub(file_name, ".pdf", "") .."]" .. "(" .. relative_path .. ")"

    return wiki_link
end

local function atomic_link()
    local opts = require("telescope.themes").get_dropdown { prompt_title = "AtomicNote Link" }
    local results = vim.fn.systemlist("ls /home/malte/documents/vimwiki_para/assets/AtomicNotes/")

    pickers.new(opts, {
        finder = finders.new_table({
            results = results
        }),
        sorter = conf.file_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)

                local pdf_name = selection.value
                local atomic_pdf_link = CreateAtomicLink(pdf_name)

                vim.api.nvim_put({ atomic_pdf_link }, "", true, true)
            end)

            return true
        end
    }):find()
end

return {
    atomic_link = atomic_link,
}
