require('mason').setup {}

require('mason-lspconfig').setup {
    ensure_installed = {
        'tsserver',
        --'sumneko_lua',
        'jedi_language_server',
        'ccls',
        'texlab',
        'gopls',
        'rust_analyzer',
        'bashls',
        'yamlls',
        'solidity_ls',
        'cssls',
        'dockerls',
        'terraform_lsp',
        'tflint',
        'eslint_d',
        'luacheck',
        'flake8',
        'mypy',
        'shellcheck',
        'cppcheck',
        'yamllint',
        'golangci_lint',
        'hadolint',
    },

    auto_update = false,

    automatic_installation = false,
}
