local map = require('utils').map

-- Default options
local opt = {}

-- Remove highlights
map('n', '<leader>/', [[ <cmd> :noh<CR> ]], opt)

-- Tabs
map('n', '<leader>tt', [[ <cmd> :tabedit<CR> ]], opt)
map('n', '<leader>tc', [[ <cmd> :tabclose<CR> ]], opt)
map('n', '<leader>to', [[ <cmd> :tabonly<CR> ]], opt)
map('n', '<leader>tn', [[ <cmd> :tabnext<CR> ]], opt)
map('n', '<leader>tp', [[ <cmd> :tabprevious<CR> ]], opt)

-- Quit
map('n', '<leader>qq', [[ <cmd> quit!<CR> ]], opt)
map('n', '<leader>qa', [[ <cmd> quitall!<CR> ]], opt)

-- Split window
map('n', 'ss', ':split<Return><C-w>w', opt)
map('n', 'sv', ':vsplit<Return><C-w>w', opt)

-- Switching tabs
local function switchtab_mapper()
    for i = 1, 9, 1 do
        local key = tostring(i)
        map('n', '<leader>' .. key, key .. 'gt')
    end
end

switchtab_mapper()
