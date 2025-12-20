return {
    { "nvim-lua/popup.nvim" },   -- An implementation of the Popup API from vim in Neovim
    { "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins

    -- cmp plugins
    {
        "hrsh7th/nvim-cmp",

        init = function()
            require 'user.cmp'
        end,
    },                         -- The completion plugin
    { "hrsh7th/cmp-buffer" },  -- buffer completions
    { "hrsh7th/cmp-path" },    -- path completions
    { "hrsh7th/cmp-cmdline" }, -- cmdline completions
    {
        "hrsh7th/cmp-nvim-lsp",

        init = function()
            require 'user.lsp'
        end,
    },
    { 'andersevenrud/cmp-tmux' },
    { "kdheepak/cmp-latex-symbols" },
    {
        'micangl/cmp-vimtex',
        init = function()
            require 'user.vimtex'
        end,
    },


    -- Mason LSP
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        "neovim/nvim-lspconfig",

        init = function()
            require 'user.mason_tools'
        end,
    },
    -- python developement
    { 'psf/black' },
    -- { 'fisadev/vim-isort' },
    {
        'mfussenegger/nvim-lint',

        init = function()
            require 'user.lint'
        end,
    },
    {
        'mfussenegger/nvim-dap-python',

        dependencies = {
            -- https://github.com/mfussenegger/nvim-dap
            'mfussenegger/nvim-dap',
        },

        init = function()
            require 'user.nvim_dap'
        end,
    },
    { 'leoluz/nvim-dap-go' },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            -- https://github.com/mfussenegger/nvim-dap
            'mfussenegger/nvim-dap',
            -- https://github.com/theHamsta/nvim-dap-virtual-text
            'theHamsta/nvim-dap-virtual-text',   -- inline variable text while debugging
            -- https://github.com/nvim-telescope/telescope-dap.nvim
            'nvim-telescope/telescope-dap.nvim', -- telescope integration with dap

            'nvim-neotest/nvim-nio'
        },

        init = function()
            require 'user.nvim_dap_ui'
        end,
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        init = function()
            require('user.telescope')
        end
    },
    { "nvim-telescope/telescope-symbols.nvim" },

    -- Commenting
    {
        "numToStr/Comment.nvim",
        config = function()
            require 'user.comment'
        end,
        dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },

    },

    -- Auto pairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    },

    -- "rebelot/kanagawa.nvim"

    -- Indent lines
    -- { "lukas-reineke/indent-blankline.nvim" },

    -- UI (Nvim-Tree, ToggleTerm, Lualine)
    {
        "kyazdani42/nvim-tree.lua",

        init = function()
            require 'user.nvim-tree'
        end,
    },
    {
        "kyazdani42/nvim-web-devicons",

        init = function()
            require 'user.devcons'
        end,
    },
    {
        "akinsho/toggleterm.nvim",

        init = function()
            require 'user.toggleterm'
        end,

    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },

        config = function()
            require 'user.lualine'
        end,
    },

    {
        priority = 900, 
        "goolord/alpha-nvim",

        init = function()
            require 'user.alpha'
        end,
    },

    -- Startup time optimizer
    {
        "lewis6991/impatient.nvim",

        init = function()
            require 'user.impatient'
        end,
    },

    -- harpoon
    -- {
    --     "ThePrimeagen/harpoon",
    --     branch = "harpoon2",
    --     dependencies = { { "nvim-lua/plenary.nvim" } },
    -- },

    {
        "folke/todo-comments.nvim",

        init = function()
            require 'user.todo'
        end,
    },

    {
        'mbbill/undotree',

        init = function()
            require 'user.undotree'
        end,

    },

    -- Vimwiki
    {
        'vimwiki/vimwiki',
        enabled = true,
        lazy = false,
        priority = 1000,
    },

    -- Trouble plugin
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {}
        end
    },

    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,          -- load at startup
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },

        config = function()
            require("user.treesitter")
        end,

    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = false,
    },


    -- Snippets
    {
        "SirVer/ultisnips",


        init = function()
            require 'user.ultisnips'
        end,
    },
    { "honza/vim-snippets" },
    { "quangnguyen30192/cmp-nvim-ultisnips" },

    -- Colorschemes
    { "AlexvZyl/nordic.nvim" },
    { "catppuccin/nvim",                    name = "catppuccin" },
    { "rose-pine/neovim",                   name = "rose-pine" },
    -- Zen mode
    {
        "folke/zen-mode.nvim",

        init = function()
            require 'user.zen'
        end,
    },
    {
        "lewis6991/gitsigns.nvim",

        init = function()
            require 'user.gitsigns'
        end,
    },

    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        }
    },

    { "christoomey/vim-tmux-navigator" },

    -- Copilot
    -- { "github/copilot.vim" },

    -- md
    {
        "iamcco/markdown-preview.nvim",
        bulid = function() vim.fn["mkdp#util#install"]() end,

        init = function()
            require 'user.markdownprev'
        end,

    },


    -- {
    --     "rmagatti/goto-preview",
    --     dependencies = { "rmagatti/logger.nvim" },
    --     event = "BufEnter",
    --     config = function()
    --         require("goto-preview").setup()
    --     end,
    -- },

    -- oil
    {
        "stevearc/oil.nvim",


        init = function()
            require 'user.oil'
        end,
    },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        bulid = 'make'
    },

    {
        'dhruvmanila/browser-bookmarks.nvim',
        version = '*'
    },

    -- vimtex
    {
        'lervag/vimtex',
        -- ft = 'tex'
    },

    {
        'mweyrich28/vimwiki_utils',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'vimwiki/vimwiki'
        },

        init = function()
            require 'user.vimwiki_utils'
        end,
    },

    {
        "ibhagwan/fzf-lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        }
    },

    { "LukeGoodsell/nextflow-vim" },

    -- { "BenGH28/neo-runner.nvim" },

    { "R-nvim/R.nvim",
      ft = "r"
    },

    -- use({
    --     'rpapallas/illustrate.nvim',
    --     dependencies = {
    --         'nvim-lua/plenary.nvim',
    --         'nvim-telescope/telescope.nvim',
    --     },
    --     config = function()
    --         require('illustrate').setup({
    --             illustration_dir = 'assets/svg',
    --         })
    --
    --         local illustrate = require('illustrate')
    --         local illustrate_finder = require('illustrate.finder')
    --
    --         vim.keymap.set('n', '<leader>is', illustrate.create_and_open_svg)
    --         vim.keymap.set('n', '<leader>io', illustrate.open_under_cursor)
    --         vim.keymap.set('n', '<leader>if', illustrate_finder.search_and_open)
    --         vim.keymap.set('n', '<leader>ic', illustrate_finder.search_create_copy_and_open)
    --     end,
    -- },)



    -- use({
    --     'MeanderingProgrammer/render-markdown.nvim',
    --     after = { 'nvim-treesitter' },
    --     dependencies = { 'echasnovski/mini.icons', opt = true }, -- if you standalone mini plugins
    --     -- dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
    -- },)



    {
        'xiyaowong/transparent.nvim',

        init = function()
            require 'user.transparent'
        end,
    },

    -- { 'Vigemus/iron.nvim' },

    {
        'folke/flash.nvim',

        init = function()
            require 'user.flash'
        end,
    },

    -- { 'sphamba/smear-cursor.nvim' },
    { "NStefan002/speedtyper.nvim", },

    {
        "mweyrich28/taskwarrior.nvim",


        init = function()
            require 'user.taskwarrior'
        end,

    },
}
