local helpers = require 'lsp.helpers'

local extension_path = os.getenv 'HOME' .. '/.vscode-oss/extensions/vadimcn.vscode-lldb-1.6.10/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

require('rust-tools').setup {
    server = {
        cmd = { 'rust-analyzer' },
        filetypes = { 'rust' },
        root_dir = require('lspconfig/util').root_pattern('Cargo.toml', 'rust-project.json'),
        on_attach = helpers.on_attach_navigation,
        settings = {
            ['rust-analyzer'] = {
                diagnostics = {
                    disabled = { 'unresolved-proc-macro' },
                },
            },
        },
    },
    tools = {
        hover_actions = {
            auto_focus = true,
        },
    },
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path),
    },
}
