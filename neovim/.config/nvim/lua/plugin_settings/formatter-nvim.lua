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

require("formatter").setup(
  {
    logging = false,
    filetype = {
      javascript = {prettierd},
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
      }
    }
  }
)
