local dap = require 'dap'

dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = { os.getenv 'HOME' .. '/dev/repos/external/vscode-node-debug2/out/src/nodeDebug.js' },
}

--dap.adapters.chrome = {
--type = 'executable',
--command = 'node',
--args = {
--os.getenv 'HOME' .. '/' .. '.vscode-oss/extensions/msjsdiag.debugger-for-chrome-4.13.0/out/src/chromeDebug.js',
--},
--}
