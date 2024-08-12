-- vim.keymap.set('i', '<C-j>', 'copilot#Accept("\\<CR>")', {
--     expr = true,
--     replace_keycodes = false
-- })
-- vim.g.copilot_no_tab_map = true
require("supermaven-nvim").setup({
    keymaps = {
        accept_suggestion = "<C-j>",
        clear_suggestion = "<C-x>",
        accept_word = "<C-J>",
    },
    ignore_filetypes = { cpp = true },
    log_level = "info",                -- set to "off" to disable logging completely
    disable_inline_completion = false, -- disables inline completion for use with cmp
    disable_keymaps = false            -- disables built in keymaps for more manual control
})
