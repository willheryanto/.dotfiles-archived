-- formatter: stylua
local stylua = { settings = {} }

-- server: eslint
local eslint = { settings = {} }

-- server: prettier
local prettier = { settings = {} }

-- formatter: eslint_d
local eslint_d = {
    settings = {
        condition = function(utils)
            return utils.root_has_file { '.eslintrc.js', '.eslintrc.json', '.eslintrc.yaml' }
        end,
    },
}

-- formatter: prettierd
local prettierd_supported_files = {
    json = true,
    markdown = true,
    css = true,
    yaml = true,
    typescriptreact = true,
}
local prettierd_memo = {}
local prettierd = {
    settings = {
        runtime_condition = function(params)
            if prettierd_memo[params.ft] ~= nil then
                return prettierd_memo[params.ft]
            end

            -- Add support directly for not JS/TS/TSX files
            if prettierd_supported_files[params.ft] ~= nil then
                prettierd_memo[params.ft] = prettierd_supported_files[params.ft]
            else
                -- Only support if eslint is not configured
                prettierd_memo[params.ft] =
                    not require('lspconfig').util.root_pattern('.eslintrc.js', '.eslintrc.json', '.eslintrc.yaml')(
                        params.bufname
                    )
            end

            return prettierd_memo[params.ft]
        end,
    },
}

-- formatter: isort
local isort = {
    settings = {
        args = {
            '--stdout',
            '--profile',
            'black',
            '-',
        },
    },
}

-- formatter: black
local black = {
    settings = {
        --args = {
        --'-l',
        --'100',
        --},
    },
}

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
--[[ local prettier = {
    settings = {
        filetypes = {
            'solidity',
        },
    },
} ]]

-- formatter: latexindent
local latexindent = { settings = {} }

-- formatter: sql-formatter
---- Use other formatter for SQL files
local sql_formatter = {
    settings = {
        command = 'sqlformat',
        args = {
            '-a',
            '$FILENAME',
        },
        filetypes = { 'sql' },
    },
}

-- formatter: terraform_fmt
local terraform_fmt = {
    settings = {
        filetypes = { 'terraform' },
    },
}

return {
    ['stylua'] = stylua,
    -- ['eslint_d'] = eslint_d,
    -- ['prettierd'] = prettierd,
    ['eslint'] = eslint,
    ['prettier'] = prettier,
    ['isort'] = isort,
    ['black'] = black,
    ['shfmt'] = shfmt,
    ['clang_format'] = clang_format,
    ['gofmt'] = gofmt,
    ['rustfmt'] = rustfmt,
    ['dart_format'] = dart_format,
    ['latexindent'] = latexindent,
    ['sqlformat'] = sql_formatter,
    ['terraform_fmt'] = terraform_fmt,
}
