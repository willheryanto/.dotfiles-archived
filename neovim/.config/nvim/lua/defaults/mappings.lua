local map = require('utils').map

-- Default options
local opt = {}

-- Remove highlights
map('n', '<leader>/', ':noh<CR> ', opt)

-- Save
map('n', '<leader>ww', ':w<CR> ', opt)

-- Tabs
map('n', '<leader>tt', ':tabedit<CR> ', opt)
map('n', '<leader>tc', ':tabclose<CR>', opt)
map('n', '<leader>to', ':tabonly<CR> ', opt)
map('n', '<leader>tn', ':tabnext<CR> ', opt)
map('n', '<leader>tp', ':tabprevious<CR> ', opt)

-- Quit
map('n', '<leader>qq', ':quit!<CR> ', opt)
map('n', '<leader>qa', ':quitall!<CR> ', opt)

-- Windows
map('n', 'ss', ':split<CR><C-w>w', opt)
map('n', 'sv', ':vsplit<CR><C-w>w', opt)
map('n', 'so', '<C-w>o', opt)

-- Switching tabs
local function switchtab_mapper()
    for i = 1, 9, 1 do
        local key = tostring(i)
        map('n', '<leader>' .. key, key .. 'gt')
    end
end

switchtab_mapper()
