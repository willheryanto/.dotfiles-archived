local helpers = require 'lsp.helpers'

local linters = require 'lsp.linters'
local formatters = require 'lsp.formatters'
local servers = require 'lsp.servers'

helpers.init_servers(servers)
helpers.init_diagnostics(linters, formatters)
