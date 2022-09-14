local M = {}

local null_ls = require 'null-ls'
local lspconfig = require 'lspconfig'

local map = require('utils').map

-- Server helpers
M.get_system_name = function()
    local system_name

    if vim.fn.has 'mac' == 1 then
        system_name = 'macOS'
    elseif vim.fn.has 'unix' == 1 then
        system_name = 'Linux'
    else
        print 'Unsupported system for sumneko'
    end

    return system_name
end

M.on_attach_navigation = function(client)
    client.resolved_capabilities.document_formatting = false

    -- Mappings.
    local opts = { noremap = true, silent = true }
    map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
end

M.on_attach_formatting = function(client)
    client.resolved_capabilities.document_formatting = true

    local opts = { noremap = true, silent = true }
    map('n', '<space>fo', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Diagnostic helpers
local function builtins(name, features, context)
    local source = null_ls.builtins[context][name]
    return source.with(features.settings)
end

local enums = {
    diagnostics = 'diagnostics',
    formatting = 'formatting',
}

local build_sources = function(linters, formatters)
    local sources = {}

    for linter, features in pairs(linters) do
        local source = builtins(linter, features, enums.diagnostics)
        table.insert(sources, source)
    end

    for formatter, settings in pairs(formatters) do
        local source = builtins(formatter, settings, enums.formatting)
        table.insert(sources, source)
    end

    return sources
end

M.init_diagnostics = function(linters, formatters)
    null_ls.setup {
        on_attach = M.on_attach_formatting,
        sources = build_sources(linters, formatters),
    }
end

M.init_servers = function(servers)
    for server, settings in pairs(servers) do
        lspconfig[server].setup(settings)
    end
end

return M
