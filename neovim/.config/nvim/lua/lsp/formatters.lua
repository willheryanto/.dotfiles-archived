-- formatter: stylua
local stylua = { settings = {} }

-- formatter: prettierd
local prettierd = {
    settings = {},
}

-- formatter: eslint_d
local eslint_d = {
    settings = {},
    alternative = {
        enable = true,
        name = 'prettierd',
        rules = function(utils)
            return utils.root_has_file { '.eslintrc.js', '.eslintrc.json', '.eslintrc.yaml' }
        end,
        settings = prettierd,
    },
}

-- formatter: black
local black = { settings = {} }

-- formatter: shfmt
local shfmt = { settings = {} }

-- formatter: clang_format
local clang_format = { settings = {} }

-- formatter: gofmt
local gofmt = { settings = {} }

-- formatter: rustfmt
local rustfmt = { settings = {} }

-- formatter: dart_format
local dart_format = { settings = {} }

-- formatter: prettier
local prettier = {
    settings = {
        filetypes = {
            'solidity',
            'markdown',
            'json',
        },
    },
}

-- formatter: latexindent
local latexindent = { settings = {} }

return {
    ['stylua'] = stylua,
    ['eslint_d'] = eslint_d,
    ['black'] = black,
    ['shfmt'] = shfmt,
    ['clang_format'] = clang_format,
    ['gofmt'] = gofmt,
    ['rustfmt'] = rustfmt,
    ['dart_format'] = dart_format,
    ['prettier'] = prettier,
    ['latexindent'] = latexindent,
}
