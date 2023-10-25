local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
lspconfig.gopls.setup {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            },
        },
        html = {
            format = {
                templating = true,
                wrapLineLength = 120,
                wrapAttributes = 'auto',
            },
            hover = {
                documentation = true,
                references = true,
            },
        },
    },
}
lspconfig.tsserver.setup {}
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.cssls.setup {
    capabilities = capabilities,
}
lspconfig.html.setup {
    capabilities = capabilities,
}
lspconfig.pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                jedi_completion = {
                    include_class_objects = true,
                    include_function_objects = true,
                    fuzzy = true,
                    eager = true
                },
                rope_autoimport = {
                    enable = true
                }
            }
        }
    }
}
