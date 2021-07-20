vim.o.completeopt = "menuone,noinsert,noselect"

require "compe".setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  source = {
    path = true,
    buffer = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true,
    tabnine = true,
    spell = true,
    tags = true,
    vsnip = true,
    ultisnips = true,
    treesitter = true
  }
}

local function keymap(k, m)
  vim.api.nvim_set_keymap("i", k, m, {noremap = true, silent = true, expr = true})
end

function Check_backspace()
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

keymap("<C-Space>", "compe#complete()")
keymap("<CR>", 'compe#confirm("<CR>")')
keymap("<C-e>", 'compe#close("<C-e>")')
keymap("<Tab>", 'pumvisible() ? "<C-n>" : v:lua.Check_backspace() ? "<Tab>" : compe#complete()')
keymap("<S-Tab>", 'pumvisible() ? "<C-p>" : v:lua.Check_backspace() ? "<S-Tab>" : compe#complete()')
