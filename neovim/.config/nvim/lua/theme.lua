require('tokyonight').setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    style = 'storm', -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
    transparent = true, -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
    },
}

vim.cmd 'colorscheme tokyonight'
