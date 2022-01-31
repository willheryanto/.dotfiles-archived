local helpers = require 'lsp.helpers'

require('flutter-tools').setup {
    widget_guides = { enabled = true },
    closing_tags = {
        highlight = 'ErrorMsg', -- highlight for the closing tag
        prefix = '>', -- character to use for close tag e.g. > Widget
        enabled = true, -- set to false to disable
    },
    lsp = {
        on_attach = helpers.on_attach_navigation,
    },
}
