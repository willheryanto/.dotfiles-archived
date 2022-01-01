-- formatter: stylua
local stylua = { settings = {} }

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
                prettierd_memo[params.ft] = not require('lspconfig').util.root_pattern(
                    '.eslintrc.js',
                    '.eslintrc.json',
                    '.eslintrc.yaml'
                )(params.bufname)
            end

            return prettierd_memo[params.ft]
        end,
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
        },
    },
}

-- formatter: latexindent
local latexindent = { settings = {} }

-- formatter: sqlformat
---- Use other formatter for SQL files
local sqlformatter = {
    settings = {
        command = 'sql-formatter',
        args = { '$FILENAME' },
        filetypes = { 'sql' },
    },
}

return {
    ['stylua'] = stylua,
    ['eslint_d'] = eslint_d,
    ['prettierd'] = prettierd,
    ['black'] = black,
    ['shfmt'] = shfmt,
    ['clang_format'] = clang_format,
    ['gofmt'] = gofmt,
    ['rustfmt'] = rustfmt,
    ['dart_format'] = dart_format,
    ['prettier'] = prettier,
    ['latexindent'] = latexindent,
    ['sqlformat'] = sqlformatter,
}
