local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install plugins here
return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"  -- Useful lua functions used ny lots of plugins


    -- cmp plugins
    use "hrsh7th/nvim-cmp"    -- The completion plugin
    use "hrsh7th/cmp-buffer"  -- buffer completions
    use "hrsh7th/cmp-path"    -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "quangnguyen30192/cmp-nvim-ultisnips" }
    use "hrsh7th/cmp-calc"

    -- Mason LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use 'folke/neodev.nvim'

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-symbols.nvim"

    -- Commenting
    use { "numToStr/Comment.nvim", commit = "2c26a00f32b190390b664e56e32fd5347613b9e2" }
    use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269" }

    -- Auto pairs
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    -- Indent lines
    -- use { "lukas-reineke/indent-blankline.nvim" }

    -- UI (Nvim-Tree, Bufferline, ToggleTerm, Lualine)
    use { "kyazdani42/nvim-tree.lua" }
    use { "kyazdani42/nvim-web-devicons" }
    -- use { "akinsho/bufferline.nvim", tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
    use { "akinsho/toggleterm.nvim" }
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

    -- TUI stuff
    use { "ahmedkhalf/project.nvim" }
    use { "goolord/alpha-nvim" }

    -- Color highlighter
    use "norcalli/nvim-colorizer.lua"

    -- Startup time optimizer
    use { "lewis6991/impatient.nvim" }

    -- my stuff
    use 'lervag/vimtex'
    -- harpoon
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }


    use('mbbill/undotree')

    -- Vimwiki
    use {
        'vimwiki/vimwiki',
    }

    -- Trouble plugin
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {}
        end
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use({
        "nvim-treesitter/nvim-treesitter-refactor",
        "nvim-treesitter/nvim-treesitter-textobjects",
    })


    -- Snippets
    use("SirVer/ultisnips")
    use("honza/vim-snippets")

    -- Colorschemes
    -- use "savq/melange-nvim"
    -- use { "catppuccin/nvim", as = "catppuccin" }
    -- use 'shaunsingh/nord.nvim'
    use 'AlexvZyl/nordic.nvim'
    use { "ellisonleao/gruvbox.nvim" }
    -- use 'gilgigilgil/anderson.vim'
    -- use "VDuchauffour/neodark.nvim"
    -- use { "rose-pine/neovim", as = "rose-pine" }


    -- Zen mode
    use { "folke/zen-mode.nvim" }
    -- use { "folke/twilight.nvim" }
    use {
        'lewis6991/gitsigns.nvim',
    }

    -- use({
    --     "kdheepak/lazygit.nvim",
    --     requires = {
    --         "nvim-lua/plenary.nvim",
    --     },
    -- })

    use { "NeogitOrg/neogit",
        requires = "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", }

    use { "christoomey/vim-tmux-navigator" }

    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }
    -- QhickScope
    use 'unblevable/quick-scope'

    -- Copilot
    use { "github/copilot.vim" }

    -- md
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })


    -- use {
    --     'rmagatti/goto-preview',
    --     config = function()
    --         require('goto-preview').setup {}
    --     end
    -- }

    -- oil
    use({
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
        end,
    })

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'tzachar/cmp-fuzzy-buffer', requires = { 'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim' } }
    use {
        'dhruvmanila/browser-bookmarks.nvim', tag = '*', }
    use { "folke/noice.nvim", requires = {
        "MunifTanjim/nui.nvim",
    }
    }
    use 'rcarriga/nvim-notify'
    
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
