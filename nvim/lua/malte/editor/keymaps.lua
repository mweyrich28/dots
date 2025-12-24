local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap C-c to <esc>
keymap("i", "<C-c>", "<Esc>", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- better paste
keymap("v", "p", '"_dP', opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
keymap("n", "<leader>pf", "<cmd>lua require'telescope.builtin'.find_files {hidden = true, no_ignore = true}<cr>", opts)
keymap("n", "<leader>pt", "<cmd>Telescope <cr>", opts)
keymap("n", "<leader>pi", "<cmd>Telescope bookmarks<cr>", opts)
keymap("n", "<leader>ps", "<cmd>lua require'telescope.builtin'.symbols()<cr>", opts)
vim.keymap.set("n", "<leader>pr", function() require'telescope.builtin'.live_grep({ additional_args = { "--hidden", "--no-ignore" }}) end, {})
keymap("n", "<leader>pw", "<cmd>Telescope grep_string<cr>", opts)
keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.treesitter()<cr>", opts)

-- keymap("n", "<leader>pb", "<cmd>FzfLua buffers<cr>", opts)
keymap("n", "<leader>pb", "<cmd>Telescope buffers<cr>", opts)

-- Comment
-- keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
-- keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)

vim.keymap.set("n", "<leader>pp", vim.cmd.NvimTreeToggle)

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Clear highlights
keymap("n", "<leader>nh", "<cmd>nohlsearch<CR>", opts)

keymap("n", "<leader>ts", "<cmd> setlocal spell! spelllang=en_us,de<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>bd<CR>", opts)

-- Open alpha
keymap("n", "<leader>A", "<cmd> Alpha <CR>", opts)

-- ToDo keybindings
keymap("n", "<leader>to", "<cmd>TodoTelescope<CR>", opts)

-- Toggle ZenMode
keymap("n", "<leader>z", "<cmd>ZenMode<CR>", opts)

-- Trouble
keymap("n", "<leader>tt", "<cmd>Trouble<CR>", opts)

-- Toggle Copilot
keymap("n", "<leader>cp", "<cmd>Copilot enable<CR>", opts)

-- Markdown Preview
vim.keymap.set("n", "<leader>o", vim.cmd.MarkdownPreview, opts)

keymap("n", "<leader>lg", "<cmd>LazyGit<CR>", opts)


--- Debugging
vim.keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
vim.keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
vim.keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
vim.keymap.set("n", '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>")
vim.keymap.set("n", '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>')
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
vim.keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
vim.keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
vim.keymap.set("n", '<leader>dd', function() require('dap').disconnect(); require('dapui').close(); end)
vim.keymap.set("n", '<leader>dt', function() require('dap').terminate(); require('dapui').close(); end)
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
vim.keymap.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end)
vim.keymap.set("n", '<leader>d?', function() local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes) end)
vim.keymap.set("n", '<leader>df', '<cmd>Telescope dap frames<cr>')
vim.keymap.set("n", '<leader>dh', '<cmd>Telescope dap commands<cr>')
vim.keymap.set("n", '<leader>de', function() require('telescope.builtin').diagnostics({default_text=":E:"}) end)


