vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_view_skim_sync = 1
-- vim.g.vimtex_view_skim_activate = 1

vim.g.vimtex_compiler_latexmk = {
    build_dir = 'build',
}

vim.g.vimtex_quickfix_ignore_filters = {
    'Underfull',
    'Overfull',
}

