local helpers = require 'lsp.helpers'

require('rust-tools').setup {
    server = {
        cmd = { 'rust-analyzer' },
        filetypes = { 'rust' },
        root_dir = require('lspconfig/util').root_pattern('Cargo.toml', 'rust-project.json'),
        on_attach = helpers.on_attach_navigation,
    },
}
