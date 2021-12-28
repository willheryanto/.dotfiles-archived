-- Define custom :GBrowse for WSL to work with vim-rhubarb

vim.cmd [[
function! IsWSL()
  if has("unix")
    let lines = readfile("/proc/version")
    if lines[0] =~ "Microsoft"
      return 1
    endif
  endif
  return 0
endfunction

if (IsWSL())
    command! -nargs=1 Browse silent exec '!explorer.exe "<args>"'
endif
]]
