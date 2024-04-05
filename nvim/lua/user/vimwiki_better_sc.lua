local Job = require('plenary.job')

function Split(str)
    local parts = {}
    for part in string.gmatch(str, "/") do
        table.insert(parts, part)
    end
    return parts
end

local function executeJob(image_name)

    -- Take sc and save it 
    Job:new({
        command = "/home/malte/.config/scripts/vimwiki_better_sc.sh",
        args = { image_name },
    }):start()

    local current_file_path = vim.fn.expand("%:p")
    local current_file_path_table = Split(current_file_path)
    local root_depth = 5 -- this should be the 'depth' of your main vimwiki folder 
    local curr_depht = 0

    for i, part in ipairs(current_file_path_table) do
        curr_depht = curr_depht + 1
    end

    local path_to_wiki_root = ""

    -- add ../ until we are in root dir of your vimwiki
    for i=1, curr_depht - root_depth,1 do
        path_to_wiki_root = path_to_wiki_root .. "../"
    end

    -- adjust path based on where you keep your images for vimwiki
    path_to_wiki_root = path_to_wiki_root .. "assets/SCREENSHOTS/" .. image_name .. ".png"
    local wiki_link = "![" .. image_name .. "]" .. "(" .. path_to_wiki_root .. ")"

    -- put the selected string under the cursor
    vim.api.nvim_put({ wiki_link }, "", true, true)
end

function WikiSc()
    local arg = vim.fn.input('Image name: ')

    if arg ~= "" then
        executeJob(arg)
    end
end
