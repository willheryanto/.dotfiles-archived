local opt = require('utils').opt

local indent = 2

opt('o', 'hidden', true)
opt('o', 'ignorecase', true)
opt('o', 'splitbelow', true)
opt('o', 'splitright', true)
opt('o', 'smartcase', true)
opt('o', 'smarttab', true)
opt('b', 'tabstop', indent)
opt('o', 'scrolloff', 4)
opt('o', 'shiftround', true)
opt('o', 'wildmode', 'list:longest')
opt('o', 'clipboard', 'unnamedplus')
opt('o', 'background', 'dark')
opt('o', 'gdefault', true)
opt('o', 'termguicolors', true)

opt('b', 'shiftwidth', indent)
opt('b', 'smartindent', true)
opt('b', 'expandtab', true)
opt('b', 'shiftwidth', indent)
opt('b', 'swapfile', false)
opt('b', 'autoread', true)

opt('w', 'number', true)
opt('w', 'relativenumber', true)
opt('w', 'wrap', false)

vim.cmd [[
syntax enable
filetype plugin indent on

autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]]
