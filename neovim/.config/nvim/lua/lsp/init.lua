local helpers = require 'lsp.helpers'

local linters = require 'lsp.linters'
local formatters = require 'lsp.formatters'
local servers = require 'lsp.servers'

require 'plugin_settings.nvim.mason'
helpers.init_servers(servers)
require 'plugin_settings.nvim.rust-tools'
require 'plugin_settings.nvim.flutter-tools'

helpers.init_diagnostics(linters, formatters)
