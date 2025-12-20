local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {

    "neovim"

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

  -- button("b", "  > BA", ":e ~/documents/zettelkasten/4_atomic_notes/bachelorarbeit_Timeline.md<CR>" ),
  button("c", "  > Config", ":e ~/.config/nvim/init.lua<CR> :cd ~/.config/nvim/ <CR>"),
  button("d", "  > DaiSyBio", ":e ~/documents/zettelkasten/4_atomic_notes/DaiSyBio_WorkDoc.md<CR>" ),
  button("f", "󰱼  > Find", ":Telescope find_files<CR>"),
  button("r", "󱈖  > Recent ", ":Telescope oldfiles <CR>"),
  button("s", "  > Snippets", ":e ~/.local/share/nvim/site/pack/packer/start/vim-snippets/UltiSnips/tex.snippets <CR> :cd ~/.local/share/nvim/site/pack/packer/start/vim-snippets/UltiSnips/ <CR>" ),
  -- button("t", "  > Tmux", ":terminal ~/.local/bin/scripts/tmux-sessionizer.sh<CR>"),
  button("t", "  > Tmux", "" ,{
    callback = function()
        vim.cmd('terminal ~/.local/bin/scripts/tmux-sessionizer.sh')
        vim.cmd('startinsert')
    end
  }),
  button("q", "  > Quit ", ":qa<CR>"),
}
dashboard.section.buttons.opts = {
  spacing = 1,
  position = "center"
}

local function footer()
	local time = os.date("%H:%M")
    -- show ram usage witout newline
    -- plugins loaded
    local plugins = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
    local worktime = vim.fn.system("/home/malte/.local/bin/scripts/worktime.sh")

    -- return plugins .. " plugins | ".. time .. "\n" .. worktime
    return worktime
end
dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Constant"
dashboard.section.header.opts.hl = "Constant"
dashboard.section.header.opts.spacing = "center"

dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
-- possible keyword values: Normal, Identifier, Statement, PreProc, Type, Comment, Constant, Special, Underlined, Ignore, Error, Todo
-- more keywords: 





