local null_ls = require 'null-ls'

local utils = require 'utils'
local map = utils.map

local linters = require 'lsp.linters'
local formatters = require 'lsp.formatters'

local on_attach = function()
    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
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
    map('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    map('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    map('n', '<space>fo', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local M = {
    diagnostics = 'diagnostics',
    formatting = 'formatting',
}

local function builtins(name, settings, context)
    local source = null_ls.builtins[context][name]
    return source.with(settings)
end

local function build_sources()
    local sources = {}

    for linter, settings in pairs(linters) do
        local source = builtins(linter, settings, M.diagnostics)
        table.insert(sources, source)
    end

    for formatter, settings in pairs(formatters) do
        local source = builtins(formatter, settings, M.formatting)
        table.insert(sources, source)
    end

    return sources
end

null_ls.setup {
    on_attach = on_attach,
    sources = build_sources(),
}
