local g = vim.g

require('nvim-tree').setup {
    renderer = {
        indent_markers = {
            enable = true,
        },
        highlight_git = true,
        root_folder_modifier = ':~',

        icons = {

            glyphs = {
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
            },

            show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = false,
            },
        },

        special_files = {
            ['README.md'] = 1,
            Makefile = 1,
            MAKEFILE = 1,
        },
    },

    actions = {
        open_file = {
            window_picker = {
                exclude = {
                    filetype = {
                        'notify',
                        'packer',
                        'qf',
                    },
                    buftype = {
                        'terminal',
                    },
                },
            },
        },
    },

    disable_netrw = true,
    hijack_netrw = false,
    open_on_setup = false,
    ignore_ft_on_setup = { '.git' },
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = false,
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
