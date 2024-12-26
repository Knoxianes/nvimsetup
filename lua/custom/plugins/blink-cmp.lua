return {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = {
        'rafamadriz/friendly-snippets',
        "mikavilpas/blink-ripgrep.nvim",
        { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    },

    -- use a release tag to download pre-built binaries
    version = 'v0.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "enter",
            ["<c-c>"] = {
                function()
                    require("blink.cmp").hide()
                end
            },
            ["<c-j>"] = {
                function()
                    require("blink.cmp").select_next()
                end
            },
            ["<c-k>"] = {
                function()
                    require("blink.cmp").select_prev()
                end
            },

            ["<c-g>"] = {
                function()
                    require("blink-cmp").show({ sources = { "ripgrep" } })
                end,
            },

        },
        completion = {
            keyword = {
                range = "full"
            },
            trigger = {
                show_on_keyword = true,

            },
            menu = {
                auto_show = true,
                draw = {
                    columns = {
                        { "label",     "label_description", gap = 1 },
                        { "kind_icon", "kind" }
                    },
                }
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 100,
            },
            ghost_text = {
                enabled = false
            },
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono'
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer', "lazydev" },
            providers = {
                lsp = { fallback_for = { "lazydev" } },
                lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
                ripgrep = {
                    module = "blink-ripgrep",
                    name = "Ripgrep",
                    ---@module "blink-ripgrep"
                    ---@type blink-ripgrep.Options
                    opts = {

                        prefix_min_len = 3,
                        context_size = 5,
                        max_filesize = "1M",
                        additional_rg_options = {},
                    },
                },
            },
        },

        signature = { enabled = true }
    },
    opts_extend = { "sources.default" }
}
