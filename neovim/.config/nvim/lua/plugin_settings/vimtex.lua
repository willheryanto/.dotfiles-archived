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
