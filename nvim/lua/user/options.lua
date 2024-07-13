vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 1                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0                         -- don't show tabs
vim.opt.smartcase = true                        -- smart case
vim.opt.autoindent = true
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true                         -- convert tabs to spaces
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4                             -- insert 2 spaces for a tab
-- vim.opt.cursorline = true                    -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true
vim.opt.laststatus = 3
vim.opt.showcmd = false
vim.opt.ruler = true
vim.opt.numberwidth = 2                         -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
-- vim.opt.colorcolumn = "81"                   -- set colorcolumn at 80 characters
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.scrolloff = 8
-- vim.opt.sidescrolloff = 8
vim.opt.guifont = "JetBrainsMono Nerd Font Mono"               -- the font used in graphical neovim applications
-- vim.o.completeopt = 'menuone,noselect'
vim.opt.guicursor = ""
vim.opt.fillchars.eob=" "
vim.opt.shortmess:append "c"
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")
vim.g.python3_host_prog = '/bin/python3'
vim.api.nvim_command('set encoding=utf-8')

-- save last cursor position
vim.cmd[[autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]

vim.g.loaded_netrw = 0

vim.api.nvim_command('highlight SpellBad cterm=underline gui=underline ctermfg=red guifg=red')

vim.cmd[[syntax enable]]

vim.cmd('filetype plugin indent on')
