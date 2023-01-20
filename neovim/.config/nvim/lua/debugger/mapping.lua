-- vim.cmd [[
--     nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
--     nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
--     nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
--     nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
--     nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
--     nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
--     nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
--     nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
--     nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
--     nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
--     nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
--     vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>
--     nnoremap <silent> <leader>du :lua require('dapui').toggle()<CR>
-- ]]

local dap_ok, dap = pcall(require, 'dap')
local dap_ui_ok, ui = pcall(require, 'dapui')

if not (dap_ok and dap_ui_ok) then
    require 'notify'('nvim-dap or dap-ui not installed!', 'warning') -- nvim-notify is a separate plugin, I recommend it too!
    return
end

vim.fn.sign_define('DapBreakpoint', { text = '🐞' })

-- Start debugging session
vim.keymap.set('n', '<leader>ds', function()
    dap.continue()
    ui.toggle {}
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>=', false, true, true), 'n', false) -- Spaces buffers evenly
end)

-- Set breakpoints, get variable values, step into/out of functions, etc.
vim.keymap.set('n', '<leader>dl', require('dap.ui.widgets').hover)
vim.keymap.set('n', '<leader>dc', dap.continue)
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dn', dap.step_over)
vim.keymap.set('n', '<leader>di', dap.step_into)
vim.keymap.set('n', '<leader>do', dap.step_out)
vim.keymap.set('n', '<leader>dC', function()
    dap.clear_breakpoints()
    require 'notify'('Breakpoints cleared', 'warn')
end)
vim.keymap.set('n', '<leader>du', ui.toggle)

-- Close debugger and clear breakpoints
vim.keymap.set('n', '<leader>de', function()
    dap.clear_breakpoints()
    ui.toggle {}
    dap.terminate()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>=', false, true, true), 'n', false)
    require 'notify'('Debugger session ended', 'warn')
end)
