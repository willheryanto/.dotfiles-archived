local function prettierd()
  return {
    exe = "prettierd",
    args = {vim.api.nvim_buf_get_name(0), "--single-quote"},
    stdin = true
  }
end

local function custom_isort_black()
  return {
    exe = "isort",
    args = {vim.api.nvim_buf_get_name(0), "-d", "--profile black", "|", "black", "-q", "-"},
    stdin = true
  }
end

local function bufname()
  return vim.api.nvim_buf_get_name(0)
end

require("formatter").setup(
  {
    logging = false,
    filetype = {
      javascript = {prettierd},
      typescript = {prettierd},
      svelte = {
        function()
          return {
            exe = "prettier",
            args = {"--plugin-search-dir=.", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      json = {prettierd},
      html = {prettierd},
      css = {prettierd},
      python = {custom_isort_black},
      dart = {
        function()
          return {
            exe = "dart format",
            args = {vim.api.nvim_buf_get_name(0), "-o", "show", "|", "sed", "\\$d"},
            stdin = true
          }
        end
      },
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      },
      go = {
        function()
          return {
            exe = "gofmt",
            args = {bufname()},
            stdin = true
          }
        end
      },
      tex = {
        function()
          return {
            exe = "latexindent",
            args = {bufname()},
            stdin = true
          }
        end
      },
      yaml = {
        function()
          return {
            exe = "yamllint",
            args = {bufname()},
            stdin = true
          }
        end
      },
      sh = {
        function()
          return {
            exe = "shfmt",
            args = {bufname()},
            stdin = true
          }
        end
      },
      sql = {
        function()
          return {
            exe = "sqlparse",
            args = {bufname()},
            stdin = true
          }
        end
      },
      rust = {
        function()
          return {
            exe = "rustfmt",
            args = {bufname(), "--emit", "stdout", "-q"},
            stdin = true
          }
        end
      }
    }
  }
)
