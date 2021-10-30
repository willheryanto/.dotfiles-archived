local function pconf(plugin) return "require(\"pluginconf." .. plugin .. "\")" end

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- LSP / code related
    use "neovim/nvim-lspconfig"
    use "mhartington/formatter.nvim"
    use "preservim/tagbar"
    use "lukas-reineke/indent-blankline.nvim"

    -- Snippets
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/cmp-vsnip"
    use "mattn/emmet-vim"
    use "rafamadriz/friendly-snippets"

    -- Specific code helper
    use "rust-lang/rust.vim"
    use "simrat39/rust-tools.nvim"
    use "fatih/vim-go"
    -- use "akinsho/flutter-tools.nvim"

    -- Helpers
    use "christoomey/vim-tmux-navigator"
    use "windwp/nvim-autopairs"
    use "alvan/vim-closetag"
    use "akinsho/nvim-bufferline.lua"
    use "folke/which-key.nvim"
    use "wellle/targets.vim"
    use "norcalli/nvim-colorizer.lua"
    use "mechatroner/rainbow_csv"

    -- File manager / utils
    use "nvim-treesitter/nvim-treesitter"
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup {} end
    }
    use "ryanoasis/vim-devicons"
    use {
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }
    use "preservim/nerdcommenter"

    -- Git related
    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"

    -- Themes/UI stuffs
    use "bluz71/vim-moonfly-colors"
    use "glepnir/galaxyline.nvim"

    -- Writing
    use "lervag/vimtex"
    use "reedes/vim-pencil"

    -- Tpope essentials
    use "tpope/vim-eunuch"
    use "tpope/vim-repeat"
    use "tpope/vim-unimpaired"
    use "tpope/vim-sensible"
    use "tpope/vim-surround"

    -- Others
    use {'dccsillag/magma-nvim', run = ':UpdateRemotePlugins'}

end, {
    display = {
        border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
    }
})
