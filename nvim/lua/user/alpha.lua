local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
		-- [[                               __                ]],
		-- [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
		-- [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
		-- [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
		-- [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
		-- [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
		-- [[                                                 ]],
		-- [[                                                                       ]],
		-- [[  ██████   █████                   █████   █████  ███                  ]],
		-- [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
		-- [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
		-- [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
		-- [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
		-- [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
		-- [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
		-- [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],

		-- [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠋⠉⣉⣉⠙⠿⠋⣠⢴⣊⣙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁⠀⢀⠔⡩⠔⠒⠛⠧⣾⠊⢁⣀⣀⣀⡙⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠛⠁⠀⠀⠀⠀⠀⡡⠊⠀⠀⣀⣠⣤⣌⣾⣿⠏⠀⡈⢿⡜⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠡⣤⣶⠏⢁⠈⢻⡏⠙⠛⠀⣀⣁⣤⢢⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[ ⣿⣿⣿⣿⣿⣿⣿⣿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣄⡀⠣⣌⡙⠀⣘⡁⠜⠈⠑⢮⡭⠴⠚⠉⠀⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[ ⣿⣿⣿⣿⣿⣿⣿⠁⠀⢀⠔⠁⣀⣤⣤⣤⣤⣤⣄⣀⠀⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠁⠀⢀⣠⢠⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[ ⣿⣿⣿⣿⣿⣿⣿⡀⠀⢸⠀⢼⣿⣿⣶⣭⣭⣭⣟⣛⣛⡿⠷⠶⠶⢶⣶⣤⣤⣤⣶⣶⣾⡿⠿⣫⣾⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[ ⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠈⠉⠉⠉⠉⠉⠙⠛⠛⠻⠿⠿⠿⠷⣶⣶⣶⣶⣶⣶⣶⣶⡾⢗⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[ ⣿⣿⣿⣿⣿⣿⣿⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣿⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⣄⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣝⡻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    -- "                                                     ",
    -- "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    -- "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    -- "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    -- "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    -- "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    -- "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    -- "                                                     ",
}
local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "Normal"
  b.opts.hl_shortcut = "Comment"
  return b
end

dashboard.section.buttons.val = {
  button("b", "󱞊  > Browse", ":e . <CR>" ),
  -- button("m", "  > Markdown Wiki", ":e ~/documents/vimwiki_para/README.md<CR>" ),
  -- button("d", "  > Open OneDrive", ":e ~/OneDriver/03_GoodNotes/<CR> :cd ~/OneDriver/03_GoodNotes/<CR>" ),
  button("f", "󰱼  > Find File   ", ":Telescope find_files <CR>"),
  button("r", "󱈖  > Recent Files   ", ":Telescope oldfiles <CR>"),
  button("g", "󱎸  > Live Grep ", ":Telescope live_grep <CR>"),
  button("s", "  > Edit Snippets", ":e ~/.local/share/nvim/site/pack/packer/start/vim-snippets/UltiSnips/tex.snippets <CR> :cd ~/.local/share/nvim/site/pack/packer/start/vim-snippets/UltiSnips/ <CR>" ),
  button("c", "  > Edit Config", ":e ~/.config/nvim/init.lua<CR> :cd ~/.config/nvim/ <CR>"),
  button("q", "  > Quit", ":qa<CR>"),
}
dashboard.section.buttons.opts = {
  spacing = 2,
  position = "center"
}

local function footer()
	local date = os.date("%d.%m.%Y")
	-- local time = os.date("%H:%M")
    -- show ram usage witout newline
    local ram = vim.fn.system("free -h | awk 'NR==2{print $3}'")
    ram = ram:gsub("\n", "")
    -- plugins loaded
    local plugins = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))

return ram .. " | " .. date .. " | " .. plugins .. " plugins"
end
dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Constant"
dashboard.section.header.opts.hl = "Constant"
dashboard.section.header.opts.spacing = "center"

dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
-- possible keyword values: Normal, Identifier, Statement, PreProc, Type, Comment, Constant, Special, Underlined, Ignore, Error, Todo
-- more keywords: 





