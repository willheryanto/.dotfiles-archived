---- Defaults
vim.g.mapleader = " "

require "defaults"
require "default-mappings"

---- Load all plugins
require "plugins"
require "plugin_settings.which-key"
require "plugin_settings.nvim-tree"
require "plugin_settings.nvim.galaxyline"
require "plugin_settings.nvim.indent-blankline"
require "plugin_settings.nvim-colorizer"
require "plugin_settings.treesitter-nvim"
require "plugin_settings.nvim.telescope"

---- LSP stuff
require "plugin_settings.nvim-lspconfig"
require "plugin_settings.nvim-cmp"

---- Code stutff
require "plugin_settings.nvim-autopairs"
require "plugin_settings.nvim-web-devicons"

---- Code helper
require "plugin_settings.nvim.formatter"
require "plugin_settings.nvim.rust-tools"
require "plugin_settings.nvim.flutter-tools"

---- Misc
require "plugin_settings.vimtex"
require "plugin_settings.copilot"

---- Colorscheme
vim.cmd("colorscheme moonfly")
