local ts_config = require 'nvim-treesitter.configs'

ts_config.setup {
    ensure_installed = {
        'javascript',
        'html',
        'css',
        'bash',
        'lua',
        'json',
        'python',
        'go',
        'cpp',
        'rust',
    },
    highlight = { enable = true, use_languagetree = true },
    tree_docs = { enable = true },
}

require('nvim-treesitter.parsers').get_parser_configs().solidity = {
    install_info = {
        url = 'https://github.com/JoranHonig/tree-sitter-solidity',
        files = { 'src/parser.c' },
        requires_generate_from_grammar = true,
    },
    filetype = 'solidity',
}
