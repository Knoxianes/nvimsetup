return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup(
            {
                settings = {
                    save_on_toggle = true
                },
            }
        )
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add to harpoon" })
        vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "Harpoon menu" })

        vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Select harpoon 1" })
        vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Select harpoon 2" })
        vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Select harpoon 3" })
        vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Select harpoon 4" })
        vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Select harpoon 5" })
    end,
}
