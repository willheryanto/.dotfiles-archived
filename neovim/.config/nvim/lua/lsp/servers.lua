local helpers = require 'lsp.helpers'

-- server: tsserver
local tsserver = {
    on_attach = helpers.on_attach_navigation,
}

-- server: sumneko_lua
local sumneko_root_path = os.getenv 'HOME' .. '/dev/repos/ext/language-servers/lua-language-server'
local sumneko_binary_path = sumneko_root_path .. '/bin/' .. helpers.get_system_name() .. '/lua-language-server'
local sumneKo_lua = {
    on_attach = helpers.on_attach_navigation,
    cmd = { sumneko_binary_path, '-E', sumneko_root_path .. '/main.lua' },
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
                vim.fn.getcwd() .. '/__pypackages__/3.9/lib',
                vim.fn.getcwd() .. '/__pypackages__/3.9/bin',
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
    filetypes = { 'go', 'gomod' },
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
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local cssls = {
    on_attach = helpers.on_attach_navigation,
    capabilities = capabilities,
}

-- server: dockerls
local dockerls = {
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
    --['pyright'] = pyright, -- Python
}
