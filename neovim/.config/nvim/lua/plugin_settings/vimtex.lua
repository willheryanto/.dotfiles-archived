--vim.g.vimtex_compiler_latexmk_engines = {
    --['xelatex'] = '-xelatex',
    --['lualatex'] = '-lualatex',
    --['pdflatex'] = '-pdflatex',
    --['pdf'] = '-pdflatex',
--}

vim.g.vimtex_compiler_latexmk = {
    build_dir = 'build',
}

-- IsWSL declared on default commands
if vim.api.nvim_eval 'IsWSL()' then
    vim.g.vimtex_view_general_viewer = 'SumatraPDF'
end
