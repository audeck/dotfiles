-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    use({
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                          , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    })

    -- Color themes
    use('jacoborus/tender.vim')
    use('savq/melange-nvim')
    use('catppuccin/nvim')

    -- Transparency
    use("xiyaowong/transparent.nvim")

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {
                'neovim/nvim-lspconfig',
                requires = 'catppuccin/nvim',
            },
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required

            -- Function signature hints
            {"ray-x/lsp_signature.nvim"},
        },
    }

    -- Status line
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Comments
    use('terrortylor/nvim-comment')

    -- Which-key
    use('folke/which-key.nvim')

    -- Surround
    use {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    }

    -- Autopair & autotag
    use('windwp/nvim-ts-autotag')
    use('windwp/nvim-autopairs')

    -- JSX/TSX formatting fix
    use('MaxMEllon/vim-jsx-pretty')

    -- Show indentation level lines
    use('lukas-reineke/indent-blankline.nvim')

    -- Harpoon
    use('ThePrimeagen/harpoon')

    -- Breadcrumbs
    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig",
        after = 'nvim-lspconfig',
    }

    -- Navbuddy
    use {
        "SmiteshP/nvim-navbuddy",
        requires = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
            "nvim-telescope/telescope.nvim" -- Optional
        }
    }

end)

