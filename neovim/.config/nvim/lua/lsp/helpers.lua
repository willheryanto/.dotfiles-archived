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
    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    map('n', 'Z', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    map('n', '<C-z>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
end

M.on_attach_formatting = function(client)
    client.resolved_capabilities.document_formatting = true

    local opts = { noremap = true, silent = true }
    map('n', '<space>fo', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Diagnostic helpers
local function builtins(name, settings, context)
    local source
    if settings.conditional then
        return require('null-ls.helpers').conditional(function(utils)
            source = settings.rules(utils) and null_ls.builtins[context][name]
                or null_ls.builtins[context][settings.alternative.name]
            return source.with(settings.alternative.settings)
        end)
    else
        source = null_ls.builtins[context][name]
        return source.with(settings)
    end
end

local enums = {
    diagnostics = 'diagnostics',
    formatting = 'formatting',
}

local build_sources = function(linters, formatters)
    local sources = {}

    for linter, settings in pairs(linters) do
        local source = builtins(linter, settings, enums.diagnostics)
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
