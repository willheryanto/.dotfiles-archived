return require("packer").startup(
  function(use)
    use "wbthomason/packer.nvim"

    -- LSP / code related
    use "nvim-treesitter/nvim-treesitter"
    use "neovim/nvim-lspconfig"
    use "kabouzeid/nvim-lspinstall"
    use "hrsh7th/nvim-compe"
    use "mhartington/formatter.nvim"
    use "mechatroner/rainbow_csv"
    use "fatih/vim-go"
    use "lukas-reineke/indent-blankline.nvim"

    -- Snippets
    use "SirVer/ultisnips"
    use "honza/vim-snippets"
    use "mattn/emmet-vim"

    -- Helpers
    use "windwp/nvim-autopairs"
    use "alvan/vim-closetag"
    use "christoomey/vim-tmux-navigator"
    use "akinsho/nvim-bufferline.lua"
    use "folke/which-key.nvim"
    use "wellle/targets.vim"
    use "norcalli/nvim-colorizer.lua"

    -- File manager / utils
    use "kyazdani42/nvim-tree.lua"
    use "kyazdani42/nvim-web-devicons"
    use "ryanoasis/vim-devicons"
    use {"nvim-telescope/telescope.nvim", requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}}
    use "nvim-telescope/telescope-media-files.nvim"
    use "preservim/nerdcommenter"

    -- Git related
    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"

    -- Themes/UI stuffs
    use "haishanh/night-owl.vim"
    use "sainnhe/everforest"
    use "arcticicestudio/nord-vim"
    use "glepnir/galaxyline.nvim"

    -- Writing
    use "lervag/vimtex"

    -- Tpope essentials
    use "tpope/vim-eunuch"
    use "tpope/vim-repeat"
    use "tpope/vim-unimpaired"
    use "tpope/vim-sensible"
    use "tpope/vim-surround"
  end,
  {
    display = {
      border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
    }
  }
)
