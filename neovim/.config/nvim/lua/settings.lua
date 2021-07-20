local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= "o" then
    scopes["o"][key] = value
  end
end

local indent = 2

opt("o", "hidden", true)
opt("o", "ignorecase", true)
opt("o", "splitbelow", true)
opt("o", "splitright", true)
opt("o", "smartcase", true)
opt("o", "smarttab", true)
opt("b", "tabstop", indent)
opt("o", "scrolloff", 4)
opt("o", "shiftround", true)
opt("o", "wildmode", "list:longest")
opt("o", "clipboard", "unnamedplus")
opt("o", "background", "dark")
opt("o", "gdefault", true)
opt("o", "termguicolors", true)

opt("b", "shiftwidth", indent)
opt("b", "smartindent", true)
opt("b", "expandtab", true)
opt("b", "shiftwidth", indent)
opt("b", "swapfile", false)
opt("b", "autoread", true)

opt("w", "number", true)
opt("w", "relativenumber", true)
opt("w", "wrap", false)

vim.cmd(
  [[
colorscheme night-owl
au VimEnter * hi! Normal ctermbg=NONE guibg=NONE
au VimEnter * hi! LineNr ctermbg=NONE guibg=NONE guifg=#4b6479
au VimEnter * hi! CursorLineNr guifg=#C5E4FD
au VimEnter * hi! EndOfBuffer ctermbg=NONE guibg=NONE
autocmd BufWritePost plugins.lua PackerCompile
]]
)

vim.api.nvim_command(
  [[
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]]
)
