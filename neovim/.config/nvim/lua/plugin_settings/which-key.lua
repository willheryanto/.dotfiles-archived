-- Which key
local wk = require("which-key")

wk.register(
  {
    t = {
      t = {"<cmd>tabnew<cr>", ":tabnew"},
      e = {"<cmd>tabedit", ":tabedit"},
      c = {"<cmd>tabclose<cr>", ":tabclose"},
      o = {"<cmd>tabonly<cr>", ":tabonly"},
      n = {"<cmd>tabnext<cr>", ":tabnext"},
      p = {"<cmd>tabprevious<cr>", ":tabprevious"},
      f = {"<cmd>tabfirst<cr>", ":tabfirst"},
      l = {"<cmd>tablast<cr>", ":tablast"},
      m = {"<cmd>tabmove", ":tabmove"}
    },
    q = {
      q = {"<cmd>quit!<cr>", "forced quit vim"},
      a = {"<cmd>quitall!<cr>", "forced quite vim all"}
    },
    w = {"<cmd>w<cr>", ""},
    g = {
      a = {"<cmd>Git add .<cr>", "add all"},
      A = {"<cmd>Git add %<cr>", "add current"},
      b = {"<cmd>Git blame<cr>", "blame"},
      B = {"<cmd>Gbrowse<cr>", "browse"},
      c = {"<cmd>Gcommit<cr>", "commit"},
      d = {"<cmd>Gdiff<cr>", "diff"},
      D = {"<cmd>Gdiffsplit!<cr>", "diff split"},
      G = {"<cmd>Gstatus<cr>", "status"},
      l = {"<cmd>Git log<cr>", "log"},
      p = {"<cmd>Git push<cr>", "push"},
      P = {"<cmd>Git pull<cr>", "pull"},
      r = {"<cmd>GRemove<cr>", "remove"},
      v = {"<cmd>GV<cr>", "view commits"},
      V = {"<cmd>GV!<cr>", "view buffer commits"},
      w = {"<cmd>Gwrite<cr>", "git write current file"},
      e = {"<cmd>Gedit<cr>", "git edit current fugitive object"}
    },
    f = {
      o = {"<cmd>FormatWrite<cr>", "format code using formatter.nvim"}
    },
    v = {
      c = {"<cmd>VimtexCompile<cr>", "compile Latex"},
      v = {"<cmd>VimtexView<cr>", "view Latex in PDF viewer"},
      t = {"<cmd>VimtexTocToggle<cr>", "toggle TOC"}
    }
  },
  {prefix = "<leader>"}
)
