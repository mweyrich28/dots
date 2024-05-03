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

    local relative_path = ""
    -- Count the number of directories to go up
    local current_dir_level = current_file_path:gsub("[^/]*", "")
    for i=1, curr_depht - root_depth,1 do
        relative_path = relative_path .. "../"
    end


    relative_path = relative_path .. "assets/SCREENSHOTS/" .. image_name .. ".png"
    local wiki_link = "![" .. image_name .. "]" .. "(" .. relative_path .. ")"

    -- put the selected string under the cursor
    vim.api.nvim_put({ wiki_link }, "", true, true)
end

function EditImage(arg)
    -- Check if an argument is provided
    if arg == nil then
        arg = vim.fn.input('Image name: ')
    end
    -- Execute the job with the provided argument
    executeJob(arg)
end
