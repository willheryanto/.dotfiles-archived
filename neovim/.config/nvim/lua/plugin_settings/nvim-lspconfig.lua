local lsp = require("lspconfig")
local map = require("utils").map

local on_attach = function(client)
    -- Mappings.
    local opts = {noremap = true, silent = true}

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    map("n", "Z", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    map("n", "<C-z>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
        opts)
    map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
        opts)
    map("n", "<space>wl",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
        opts)
    map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    map("n", "<space>e",
        "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    map("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    map("n", "<space>fe", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- https://github.com/theia-ide/typescript-language-server
lsp.tsserver.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        on_attach(client)
    end,
    filetypes = {
        "javascript", "javascriptreact", "javascript.jsx", "typescript",
        "typescript.tsx", "typescriptreact"
    }
}

-- https://github.com/mattn/efm-langserver
-- Used only for eslint_d
local eslint = require "efm/eslint"

local function decode_eslint()
    local package_json = vim.fn.filereadable("package.json")
    if package_json == 1 then
        return vim.fn.json_decode(package_json)["eslintConfig"]
    end
end

local function eslint_config_exists()
    local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

    if not vim.tbl_isempty(eslintrc) then return true end

    if pcall(decode_eslint) then
        return true
    else
        return false
    end

    return false
end

lsp.efm.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = true
        on_attach(client)
    end,
    init_options = {documentFormatting = true},
    root_dir = function()
        if not eslint_config_exists() then return nil end
        return vim.fn.getcwd()
    end,
    settings = {
        languages = {
            typescript = {eslint},
            javascript = {eslint},
            typescriptreact = {eslint},
            javascriptreact = {eslint},
            ["javascript.jsx"] = {eslint},
            ["typescript.tsx"] = {eslint}
        }
    },
    filetypes = {
        "javascript", "javascriptreact", "javascript.jsx", "typescript",
        "typescript.tsx", "typescriptreact"
    }
}

-- Lua
local system_name
if vim.fn.has("mac") == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
    system_name = "Windows"
else
    print("Unsupported system for sumneko")
end

local sumneko_root_path = os.getenv("HOME") ..
                              "/dev/repos/ext/language-servers/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name ..
                           "/lua-language-server"

lsp.sumneko_lua.setup({
    on_attach = on_attach,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";")
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                enable = true,
                globals = {"vim"}
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {enable = false}
        }
    }
})

-- pyright
-- lsp.pyright.setup({
-- cmd = {"pyright-langserver", "--stdio"},
-- on_attach = on_attach,
-- filetypes = {"python"},
-- settings = {
-- python = {
-- analysis = {
-- extraPaths = {
-- vim.fn.getcwd() .. "/__pypackages__/3.9/lib",
-- vim.fn.getcwd() .. "/__pypackages__/3.9/bin"
-- }
-- }
-- }
-- }
-- })

-- https://github.com/pappasam/jedi-language-server
lsp.jedi_language_server.setup({
    on_attach = on_attach,
    init_options = {
        workspace = {
            extraPaths = {
                vim.fn.getcwd() .. "/__pypackages__/3.9/lib",
                vim.fn.getcwd() .. "/__pypackages__/3.9/bin"
            }
        }
    },
    filetypes = {"python"}
})

lsp.diagnosticls.setup({
    filetypes = {"python"},
    init_options = {
        filetypes = {python = {"flake8", "dmypy"}},
        linters = {
            flake8 = {
                debounce = 100,
                sourceName = "flake8",
                command = "flake8",
                args = {
                    "--format", "%(row)d:%(col)d:%(code)s:%(code)s: %(text)s",
                    "%file"
                },
                formatPattern = {
                    "^(\\d+):(\\d+):(\\w+):(\\w).+: (.*)$",
                    {
                        line = 1,
                        column = 2,
                        message = {"[", 3, "] ", 5},
                        security = 4
                    }
                },
                securities = {
                    E = "error",
                    W = "warning",
                    F = "info",
                    B = "hint"
                }
            },
            dmypy = {
                debounce = 100,
                sourceName = "dmypy",
                command = "dmypy",
                args = {
                    "run", "--", "%file", "--show-error-codes",
                    "--show-column-numbers", "--ignore-missing-imports"
                },
                formatPattern = {
                    "^(.*):(\\d+):(\\d+): (\\w+): (.*) \\[(.*)\\]$",
                    {
                        line = 2,
                        columm = 3,
                        message = {"[", 6, "] ", 5},
                        security = 4
                    }
                },
                securities = {error = "error", note = "info"}
            }
        }
    }
})

-- https://clangd.llvm.org/installation.html
lsp.clangd.setup({
    on_attach = on_attach,
})

-- https://github.com/latex-lsp/texlab
lsp.texlab.setup({
    cmd = {
        os.getenv("HOME") ..
            "/repos/ext/language-servers/texlab/target/release/texlab"
    },
    on_attach = on_attach,
    filetypes = {"tex"}
})

-- go
lsp.gopls.setup({
    on_attach = on_attach,
    cmd = {"gopls"},
    filetypes = {"go", "gomod"}
})

-- https://github.com/bash-lsp/bash-language-server
require"lspconfig".bashls.setup {on_attach = on_attach}

-- https://github.com/redhat-developer/yaml-language-server
require"lspconfig".yamlls.setup {on_attach = on_attach}
