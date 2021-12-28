vim.g.vimtex_compiler_latexmk_engines = {
    ['xelatex'] = '-xelatex',
    ['lualatex'] = '-lualatex',
    ['pdflatex'] = '-pdflatex',
    ['pdf'] = '-pdflatex',
}

vim.g.vimtex_compiler_latexmk = {
    build_dir = './build',
    callback = 1,
    continuous = 1,
    executable = 'latexmk',
    options = {
        '-verbose',
        '-shell-escape',
        '-synctex=1',
        '-interaction=nonstopmode',
    },
}

-- IsWSL declared on default commands
if vim.api.nvim_eval 'IsWSL()' then
    vim.g.vimtex_view_general_viewer = 'SumatraPDF'
end
