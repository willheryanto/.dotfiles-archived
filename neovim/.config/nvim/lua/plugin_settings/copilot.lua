vim.g.copilot_filetypes = {
    ['cpp'] = true,
    ['rust'] = true,
    ['python'] = true,
}

vim.cmd [[
imap <silent><script><expr> <C-Bslash> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
]]
