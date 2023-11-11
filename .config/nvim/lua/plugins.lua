return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { "catppuccin/nvim", as = "catppuccin" }
    use "mbbill/undotree"
    use "neovim/nvim-lspconfig"
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use("tpope/vim-repeat")
    use("ggandor/leap.nvim")
    use('3rd/image.nvim')
    use {
        'Wansmer/langmapper.nvim',
        config = function()
            require('langmapper').setup({ --[[ your config ]] })
        end,
    }
end)
