return {
    ['stylua'] = {},
    ['eslint_d'] = {
        conditional = true,
        alternative = {
            name = 'prettierd',
            settings = {},
        },
        rules = function(utils)
            return utils.root_has_file '.eslintrc.*'
        end,
    },
    ['black'] = {},
    ['shfmt'] = {},
    ['clang_format'] = {},
    ['gofmt'] = {},
    ['rustfmt'] = {},
    ['dart_format'] = {},
}
