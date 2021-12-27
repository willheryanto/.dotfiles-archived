local utils = {}

utils.scopes = {
    o = vim.o,
    b = vim.bo,
    w = vim.wo,
}

utils.opt = function(scope, key, value)
    utils.scopes[scope][key] = value
    if scope ~= 'o' then
        utils.scopes['o'][key] = value
    end
end

function utils.map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function utils.dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. '[' .. k .. '] = ' .. utils.dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

return utils
