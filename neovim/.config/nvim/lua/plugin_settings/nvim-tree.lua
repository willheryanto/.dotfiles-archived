local g = vim.g

g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_root_folder_modifier = ':~'

g.nvim_tree_window_picker_exclude = {
    filetype = {
        'notify',
        'packer',
        'qf',
    },
    buftype = {
        'terminal',
    },
}

g.nvim_tree_special_files = {
    ['README.md'] = 1,
    Makefile = 1,
    MAKEFILE = 1,
}
g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 0,
}

g.nvim_tree_icons = {
    default = ' ',
    symlink = ' ',
    git = {
        unstaged = '✗',
        staged = '✓',
        unmerged = '',
        renamed = '➜',
        untracked = '★',
        deleted = '',
        ignored = '◌',
    },
    folder = {
        arrow_open = '',
        arrow_closed = '',
        default = '',
        open = '',
        empty = '',
        empty_open = '',
        symlink = '',
        symlink_open = '',
    },
}

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require('nvim-tree').setup {
    disable_netrw = true,
    hijack_netrw = false,
    open_on_setup = false,
    ignore_ft_on_setup = { ".git" },
    auto_close = false,
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = false,
    update_to_buf_dir = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = false,
        icons = {
            hint = '',
            info = '',
            warning = '',
            error = '',
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {},
    },
    system_open = {
        cmd = nil,
        args = {},
    },
    filters = {
        dotfiles = false,
        custom = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        auto_resize = false,
        mappings = {
            custom_only = false,
            list = {},
        },
        number = false,
        relativenumber = false,
        signcolumn = 'yes',
    },
    trash = {
        cmd = 'trash',
        require_confirm = true,
    },
}

vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })
