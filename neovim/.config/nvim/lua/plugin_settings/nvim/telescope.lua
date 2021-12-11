require("telescope").setup {
    defaults = {
        vimgrep_arguments = {
            "rg", "--color=never", "--no-heading", "--with-filename",
            "--line-number", "--column", "--smart-case"
        },
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {mirror = false},
            vertical = {mirror = false}
        },
        file_sorter = require"telescope.sorters".get_fuzzy_file,
        file_ignore_patterns = {".git"},
        generic_sorter = require"telescope.sorters".get_generic_fuzzy_sorter,
        path_display = {},
        winblend = 0,
        border = {},
        borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
        use_less = true,
        color_devicons = true,
        set_env = {["COLORTERM"] = "truecolor"} -- default = nil,
    }
}

-- Mapping
local map = require("utils").map

local opt = {noremap = true, silent = true}
map("n", "<C-p>",
    [[:Telescope find_files find_command=fd,--type,f,--hidden,--follow,--exclude,".git".<CR>]],
    opt)
map("n", "<leader>rg", [[:Telescope live_grep<CR>]], opt)
