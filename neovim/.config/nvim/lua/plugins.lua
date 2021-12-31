local packer = require 'packer'

packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Dev environment
    ---- LSP / Diagnostics
    use 'neovim/nvim-lspconfig'
    use 'jose-elias-alvarez/null-ls.nvim'

    ---- Autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'mattn/emmet-vim'
    use 'github/copilot.vim'

    ---- Snippets
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'
    use 'Devzstudio/Vscode-Emoji-Snippets'

    ---- Syntax highlighting
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/playground'
    use 'nvim-treesitter/nvim-tree-docs'

    ---- Notifications / Popup
    use 'folke/trouble.nvim'
    use 'kosayoda/nvim-lightbulb'
    use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }

    ---- Navigations
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('nvim-tree').setup {}
        end,
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
    }
    use 'preservim/tagbar'

    ---- Git helpers
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb' -- Enable GBrowse

    ---- Utils
    use 'preservim/nerdcommenter' -- Comment keybindings
    use 'lukas-reineke/indent-blankline.nvim'
    use 'tpope/vim-surround' -- "Surround" keybindings

    ---- Specific language helpers
    use 'rust-lang/rust.vim'
    use 'simrat39/rust-tools.nvim'
    use 'fatih/vim-go'
    use 'akinsho/flutter-tools.nvim'

    -- Helpers
    use 'christoomey/vim-tmux-navigator'
    use 'windwp/nvim-autopairs'
    use 'alvan/vim-closetag'
    use 'akinsho/nvim-bufferline.lua'
    use 'folke/which-key.nvim'
    use 'wellle/targets.vim'
    use 'norcalli/nvim-colorizer.lua'
    use 'mechatroner/rainbow_csv'

    -- UI
    ---- Statusline
    use 'nvim-lualine/lualine.nvim'

    ---- Icons
    use 'ryanoasis/vim-devicons'

    ---- Themes
    use 'bluz71/vim-moonfly-colors'
    use 'rebelot/kanagawa.nvim'

    -- Others
    ---- Writing
    use 'lervag/vimtex'
    use 'reedes/vim-pencil'

    ---- Uncategorized
    use 'tpope/vim-eunuch' -- Various unix command
    use 'tpope/vim-repeat' -- Stonk `.` command
    use 'tpope/vim-unimpaired' -- Nice to have keybindings
    use 'tpope/vim-sensible' -- Sensible defaults
end, {
    display = {
        border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
    },
})

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

return packer
