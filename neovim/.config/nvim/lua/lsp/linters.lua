-- linter: eslint_d
local eslint_d = {
    settings = {
        condition = function(utils)
            return utils.root_has_file { '.eslintrc.js', '.eslintrc.json', '.eslintrc.yaml' }
        end,
    },
}

-- server: eslint
local eslint = { settings = {} }

-- linter: luacheck
local luacheck = { settings = {} }

-- linter: flake8
local flake8 = { settings = {} }

-- linter: pyre
local mypy = { settings = {} }

-- linter: shellcheck
local shellcheck = { settings = {} }

-- linter: cppcheck
local cppcheck = { settings = {} }

-- linter: yamllint
local yamllint = { settings = {} }

-- linter: golangci_lint
local golangci_lint = { settings = {} }

-- linter: hadolint
local hadolint = { settings = {} }

-- linter: credo
local credo = {
    settings = {
        filetypes = { 'elixir', 'heex' },
    },
}

return {
    -- ['eslint_d'] = eslint_d,
    ['eslint'] = eslint,
    ['luacheck'] = luacheck,
    ['flake8'] = flake8,
    ['mypy'] = mypy,
    ['shellcheck'] = shellcheck,
    ['cppcheck'] = cppcheck,
    ['yamllint'] = yamllint,
    ['golangci_lint'] = golangci_lint,
    ['hadolint'] = hadolint,
    ['credo'] = credo,
}
