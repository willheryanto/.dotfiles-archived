vim.g.copilot_filetypes = {
    ['cpp'] = false,
    ['rust'] = false,
    ['python'] = false,
}

vim.cmd [[
imap <silent><script><expr> <C-Bslash> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
]]
