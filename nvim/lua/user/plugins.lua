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

    -- Mason LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        "neovim/nvim-lspconfig"
    }
    -- python developement
    use { 'psf/black' }
    use { 'fisadev/vim-isort' }
    use { 'mfussenegger/nvim-lint' }
    use { 'mfussenegger/nvim-dap-python',
        requires = {
            -- https://github.com/mfussenegger/nvim-dap
            'mfussenegger/nvim-dap',
        }
    }
    use { 'rcarriga/nvim-dap-ui',
        requires = {
            -- https://github.com/mfussenegger/nvim-dap
            'mfussenegger/nvim-dap',
            -- https://github.com/theHamsta/nvim-dap-virtual-text
            'theHamsta/nvim-dap-virtual-text', -- inline variable text while debugging
            -- https://github.com/nvim-telescope/telescope-dap.nvim
            'nvim-telescope/telescope-dap.nvim', -- telescope integration with dap

            'nvim-neotest/nvim-nio'
        }
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
    use { "lukas-reineke/indent-blankline.nvim" }

    -- UI (Nvim-Tree, ToggleTerm, Lualine)
    use { "kyazdani42/nvim-tree.lua" }
    use { "kyazdani42/nvim-web-devicons" }
    use { "akinsho/toggleterm.nvim" }
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

    use { "goolord/alpha-nvim" }

    -- Color highlighter
    use "norcalli/nvim-colorizer.lua"

    -- Startup time optimizer
    use { "lewis6991/impatient.nvim" }

    -- harpoon
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }


    use { 'mbbill/undotree' }

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
        -- "nvim-treesitter/nvim-treesitter-textobjects",
    })


    -- Snippets
    use("SirVer/ultisnips")
    use("honza/vim-snippets")

    -- Colorschemes
    -- use "savq/melange-nvim"
    use { "catppuccin/nvim", as = "catppuccin" }
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

    use({
        "kdheepak/lazygit.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })

    use { "christoomey/vim-tmux-navigator" }

    -- Copilot
    use { "github/copilot.vim" }

    -- md
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })


    -- oil
    use { "stevearc/oil.nvim" }

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }
    use {
        'dhruvmanila/browser-bookmarks.nvim',
        tag = '*',
    }

    -- vimtex
    use {
        'lervag/vimtex',
        ft = 'tex',
    }

    use {
        'mweyrich28/vimwiki_utils',
        requires = {
            'nvim-telescope/telescope.nvim',
            'vimwiki/vimwiki'
        }
    }

    -- use { 'junegunn/fzf.vim' }
    use { "ibhagwan/fzf-lua",
      requires = { "nvim-tree/nvim-web-devicons" }
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
