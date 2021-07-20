-- Load all plugins and basic settings
require "plugins"

vim.g.mapleader = " "

require "settings"
require "mappings"

require "file-icons"
require "plugin_settings.which-key"
require "plugin_settings.nvim-tree"
require "statusline"
require("colorizer").setup()

--require "plugin_settings.indent-blankline"
require "plugin_settings.treesitter-nvim"
require "plugin_settings.telescope"
require("nvim-autopairs").setup()

---- LSP stuff
require "plugin_settings.nvim-lspinstall"
require "plugin_settings.nvim-lspconfig"
require "plugin_settings.nvim-compe"
require "plugin_settings.formatter-nvim"
