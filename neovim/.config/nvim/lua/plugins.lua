local packer = require 'packer'

packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Dev environment
    ---- LSP / Diagnostics
    use {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'jose-elias-alvarez/null-ls.nvim'
    }

    use { 'glepnir/lspsaga.nvim', branch = 'main' }

    ---- Autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'

    use 'mattn/emmet-vim'
    use 'github/copilot.vim'

    ---- Snippets
    use { 'L3MON4D3/LuaSnip', tag = 'v1.*' }
    use 'rafamadriz/friendly-snippets'
    --use 'Devzstudio/Vscode-Emoji-Snippets'

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
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
    }
    use 'preservim/tagbar'

    ---- Git helpers
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb' -- Enable GBrowse
    use 'lewis6991/gitsigns.nvim'

    ---- PlantUML
    use 'tyru/open-browser.vim'
    use 'aklt/plantuml-syntax'
    use 'weirongxu/plantuml-previewer.vim'

    ---- Utils
    --use 'preservim/nerdcommenter' -- Comment keybindings
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
    }
    use 'lukas-reineke/indent-blankline.nvim'
    use 'tpope/vim-surround' -- "Surround" keybindings

    ---- Specific language helpers
    use 'jose-elias-alvarez/typescript.nvim'
    use 'rust-lang/rust.vim'
    use 'simrat39/rust-tools.nvim'
    use 'fatih/vim-go'
    use 'akinsho/flutter-tools.nvim'
    use 'mhanberg/elixir.nvim'
    use 'evanleck/vim-svelte'

    ---- Debugger
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-dap-python'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use { 'michaelb/sniprun', run = 'bash ./install.sh' }

    -- Helpers
    use 'christoomey/vim-tmux-navigator'
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    -- use 'alvan/vim-closetag'
    use 'folke/which-key.nvim'
    use 'wellle/targets.vim'
    use 'norcalli/nvim-colorizer.lua'
    use 'mechatroner/rainbow_csv'

    -- UI
    ---- Statusline
    use 'nvim-lualine/lualine.nvim'

    ---- Tabs
    use { 'akinsho/bufferline.nvim', tag = 'v3.*', requires = 'kyazdani42/nvim-web-devicons' }

    ---- Icons
    use 'ryanoasis/vim-devicons'

    ---- Themes
    use 'bluz71/vim-moonfly-colors'
    use 'rebelot/kanagawa.nvim'
    use 'folke/tokyonight.nvim'

    ---- Notification
    use 'rcarriga/nvim-notify'

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
