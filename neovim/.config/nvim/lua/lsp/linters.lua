-- linter: eslint_d
local eslint_d = {
    settings = {
        condition = function(utils)
            return utils.root_has_file { '.eslintrc.js', '.eslintrc.json', '.eslintrc.yaml' }
        end,
    },
}

-- linter: luacheck
local luacheck = { settings = {} }

-- linter: flake8
local flake8 = { settings = {} }

-- linter: shellcheck
local shellcheck = { settings = {} }

-- linter: cppcheck
local cppcheck = { settings = {} }

-- linter: yamllint
local yamllint = { settings = {} }

-- linter: golangci_lint
local golangci_lint = { settings = {} }

return {
    ['eslint_d'] = eslint_d,
    ['luacheck'] = luacheck,
    ['flake8'] = flake8,
    ['shellcheck'] = shellcheck,
    ['cppcheck'] = cppcheck,
    ['yamllint'] = yamllint,
    ['golangci_lint'] = golangci_lint,
}
