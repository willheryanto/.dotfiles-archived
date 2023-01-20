local dap = require 'dap'

require('dap').set_log_level 'INFO'

dap.configurations.javascript = {
    {
        name = 'Launch',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
    },
    {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = 'Attach to process',
        type = 'node2',
        request = 'attach',
        processId = require('dap.utils').pick_process,
    },
}

dap.configurations.typescript = {
    {
        name = 'Launch',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
    },
    {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = 'Attach to process',
        type = 'node2',
        request = 'attach',
        processId = require('dap.utils').pick_process,
    },
}

dap.configurations.go = {
    {
        type = 'go', -- Which adapter to use
        name = 'Debug', -- Human readable name
        request = 'launch', -- Whether to "launch" or "attach" to program
        program = '${file}', -- The buffer you are focused on when running nvim-dap
    },
    {
        type = 'go',
        name = 'Debug test (go.mod)',
        request = 'launch',
        mode = 'test',
        program = './${relativeFileDirname}',
    },
    {
        type = 'go',
        name = 'Attach (Pick Process)',
        mode = 'local',
        request = 'attach',
        processId = require('dap.utils').pick_process,
    },
    {
        type = 'go',
        name = 'Attach (127.0.0.1:9080)',
        mode = 'remote',
        request = 'attach',
        port = '9080',
    },
}

dap.configurations.javascriptreact = { -- change this to javascript if needed
    {
        type = 'chrome',
        request = 'attach',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        port = 9222,
        webRoot = '${workspaceFolder}',
    },
}

dap.configurations.typescriptreact = { -- change to typescript if needed
    {
        type = 'chrome',
        request = 'attach',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        port = 9222,
        webRoot = '${workspaceFolder}',
    },
}
