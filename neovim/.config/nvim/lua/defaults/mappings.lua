-- Basic mapper
local map = require('utils').map

local opt = {}
map('n', '<C-j>', [[ 5j ]], opt)
map('n', '<C-k>', [[ 5k ]], opt)
map('v', '<C-j>', [[ 5j ]], opt)
map('v', '<C-k>', [[ 5k ]], opt)
map('n', 'H', [[ ^ ]], opt)
map('n', 'L', [[ $ ]], opt)
map('v', 'H', [[ ^ ]], opt)
map('v', 'L', [[ $ ]], opt)
map('n', '<leader>/', [[ <Cmd> :noh<CR> ]], opt)

-- Switching tabs mapper
local function switchtab_mapper()
    for i = 1, 9, 1 do
        local key = tostring(i)
        map('n', '<leader>' .. key, key .. 'gt')
    end
end

switchtab_mapper()
