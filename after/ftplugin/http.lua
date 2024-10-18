vim.keymap.set("n", "<leader>le", function()
    require("telescope").load_extension("rest")
    require("telescope").extensions.rest.select_env()
end, { desc = "Load env variables" })
