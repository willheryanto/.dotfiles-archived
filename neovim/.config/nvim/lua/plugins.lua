return require("packer").startup(
  function(use)
    use "wbthomason/packer.nvim"

    -- LSP / code related
    use "neovim/nvim-lspconfig"
    use "hrsh7th/nvim-compe"
    use "mhartington/formatter.nvim"
    use "preservim/tagbar"
    use "lukas-reineke/indent-blankline.nvim"

    -- Snippets
    use "SirVer/ultisnips"
    use "honza/vim-snippets"
    use "mattn/emmet-vim"

    -- Specific code helper
    use "rust-lang/rust.vim"
    use "simrat39/rust-tools.nvim"
    use "fatih/vim-go"
    use "akinsho/flutter-tools.nvim"

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
    use "kyazdani42/nvim-tree.lua"
    use "kyazdani42/nvim-web-devicons"
    use "ryanoasis/vim-devicons"
    use {
      "nvim-telescope/telescope.nvim",
      branch = "async_v2",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }
    use "preservim/nerdcommenter"

    -- Git related
    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"

    -- Themes/UI stuffs
    use "haishanh/night-owl.vim"
    use "bluz71/vim-moonfly-colors"
    use "bluz71/vim-nightfly-guicolors"
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
