local helpers = require 'lsp.helpers'
local map = require('utils').map

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
    },
}
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require "lspconfig"

lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
    capabilities = capabilities,
})

-- server: tsserver
local tsserver = {
    init_options = require('nvim-lsp-ts-utils').init_options,
    on_attach = function(client, bufnr)
        local ts_utils = require 'nvim-lsp-ts-utils'

        -- defaults
        ts_utils.setup {
            debug = false,
            disable_commands = false,
            enable_import_on_completion = false,

            -- import all
            import_all_timeout = 5000, -- ms
            -- lower numbers = higher priority
            import_all_priorities = {
                same_file = 1, -- add to existing import statement
                local_files = 2, -- git files or files with relative path markers
                buffer_content = 3, -- loaded buffer content
                buffers = 4, -- loaded buffer names
            },
            import_all_scan_buffers = 100,
            import_all_select_source = false,
            -- if false will avoid organizing imports
            always_organize_imports = true,

            -- filter diagnostics
            filter_out_diagnostics_by_severity = {},
            filter_out_diagnostics_by_code = {},

            -- inlay hints
            auto_inlay_hints = true,
            inlay_hints_highlight = 'Comment',
            inlay_hints_priority = 200, -- priority of the hint extmarks
            inlay_hints_throttle = 150, -- throttle the inlay hint request
            inlay_hints_format = { -- format options for individual hint kind
                Type = {},
                Parameter = {},
                Enum = {},
                -- Example format customization for `Type` kind:
                -- Type = {
                --     highlight = "Comment",
                --     text = function(text)
                --         return "->" .. text:sub(2)
                --     end,
                -- },
            },

            -- update imports on file move
            update_imports_on_move = false,
            require_confirmation_on_move = false,
            watch_dir = nil,
        }

        -- required to fix code action ranges and filter diagnostics
        ts_utils.setup_client(client)

        -- no default maps, so you may want to define some here
        client.resolved_capabilities.document_formatting = false

        -- Mappings.
        local opts = { noremap = true, silent = true }

        map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    end,
}

-- server: sumneko_lua
local sumneKo_lua = {
    on_attach = helpers.on_attach_navigation,
    cmd = { 'lua-language-server' },
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                enable = true,
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false },
        },
    },
}

-- server: jedi_language_server
local jedi_language_server = {
    on_attach = helpers.on_attach_navigation,
    init_options = {
        workspace = {
            extraPaths = {
                vim.fn.getcwd() .. '/__pypackages__/3.10.2/lib',
                vim.fn.getcwd() .. '/__pypackages__/3.10.2/bin',
            },
        },
    },
    filetypes = { 'python' },
}

-- server: ccls
local ccls = {

    on_attach = helpers.on_attach_navigation,
}

-- server: texlab
local texlab = {
    on_attach = helpers.on_attach_navigation,
    cmd = { 'texlab' },
    filetypes = { 'tex' },
}

-- server: gopls
local gopls = {
    on_attach = helpers.on_attach_navigation,
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'proto' },
}

-- server: bashls
local bashls = {

    on_attach = helpers.on_attach_navigation,
}

-- server: yamlls
local yamlls = {

    on_attach = helpers.on_attach_navigation,
}

-- server: solidity_ls
local solidity_ls = {
    on_attach = helpers.on_attach_navigation,
}

-- server: pyright
local pyright = {
    on_attach = helpers.on_attach_navigation,
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    settings = {
        python = {
            analysis = {
                extraPaths = {
                    vim.fn.getcwd() .. '/__pypackages__/3.9/lib',
                    vim.fn.getcwd() .. '/__pypackages__/3.9/bin',
                },
            },
        },
    },
}

-- server: cssls
local cssls = {
    on_attach = helpers.on_attach_navigation,
}

-- server: dockerls
local dockerls = {
    on_attach = helpers.on_attach_navigation,
}

-- server: terraform_lsp
local terraform_lsp = {
    on_attach = helpers.on_attach_navigation,
}

-- server: tflint
local tflint = {
    on_attach = helpers.on_attach_navigation,
}

return {
    ['tsserver'] = tsserver, -- JS/TS
    ['sumneko_lua'] = sumneKo_lua, -- Lua
    ['jedi_language_server'] = jedi_language_server, -- Python
    ['ccls'] = ccls, -- C/C++
    ['texlab'] = texlab, -- LaTex
    ['gopls'] = gopls, -- Go
    ['bashls'] = bashls, -- Bash
    ['yamlls'] = yamlls, -- YAML
    ['solidity_ls'] = solidity_ls, -- Solidity
    ['cssls'] = cssls, -- Bash
    ['dockerls'] = dockerls,
    ['terraform_lsp'] = terraform_lsp,
    ['tflint'] = tflint,
    --['pyright'] = pyright, -- Python
}
