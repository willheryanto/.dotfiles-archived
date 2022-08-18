-- Which key
local wk = require 'which-key'

wk.register({
    t = {
        t = { '<cmd>tabnew<cr>', ':tabnew' },
        c = { '<cmd>tabclose<cr>', ':tabclose' },
        o = { '<cmd>tabonly<cr>', ':tabonly' },
        n = { '<cmd>tabnext<cr>', ':tabnext' },
        p = { '<cmd>tabprevious<cr>', ':tabprevious' },
        b = { '<cmd>TagbarToggle<cr>', ':TagbarToggle' },
        l = { '<cmd>TroubleToggle<cr>', ':Trouble' },
    },
    q = {
        q = { '<cmd>quit!<cr>', 'forced quit vim' },
        a = { '<cmd>quitall!<cr>', 'forced quite vim all' },
    },
    w = { '<cmd>w<cr>', '' },
    g = {
        b = { '<cmd>Git blame<cr>', 'blame' },
        B = { '<cmd>GBrowse<cr>', 'browse' },
        c = { '<cmd>Git commit<cr>', 'commit' },
        d = { '<cmd>Gdiff<cr>', 'diff' },
        D = { '<cmd>Gdiffsplit!<cr>', 'diff split' },
        G = { '<cmd>Git<cr>', 'status' },
        l = { '<cmd>Gclog %<cr>', 'log' },
        p = { '<cmd>Git push<cr>', 'push' },
        P = { '<cmd>Git pull<cr>', 'pull' },
        R = { '<cmd>GRemove<cr>', 'remove' },
        v = { '<cmd>GV<cr>', 'view commits' },
        V = { '<cmd>GV!<cr>', 'view buffer commits' },
        w = { '<cmd>Gwrite<cr>', 'git write current file' },
        e = { '<cmd>Gedit<cr>', 'git edit current fugitive object' },
    },
    v = {
        c = { '<cmd>VimtexCompile<cr>', 'compile Latex' },
        v = { '<cmd>VimtexView<cr>', 'view Latex in PDF viewer' },
        t = { '<cmd>VimtexTocToggle<cr>', 'toggle TOC' },
    },
    z = { c = { '<cmd>LspRestart<cr>', 'restart LSP' } },
}, { prefix = '<leader>' })
