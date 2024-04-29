-- local mark = require("harpoon.mark")
-- local ui = require("harpoon.ui")

local harpoon = require("harpoon")

harpoon:setup(
    {
        settings = {
            save_on_toggle = true
        },
    }
)

-- require("telescope").load_extension('harpoon')
-- vim.keymap.set("n", "<leader>a", mark.add_file,{desc='Harpoon add file'})
-- vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu,{desc='Harpoon menu'})
-- vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end,{desc='Harpoon go to 1'})
-- vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end,{desc='Harpoon go to 2'})
-- vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end,{desc='Harpoon go to 3'})
-- vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end,{desc='Harpoon go to 4'})
-- vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end,{desc='Harpoon go to 5'})
-- vim.keymap.set("n", "<leader>z", function() ui.nav_prev() end,{desc='Harpoon go to prev'})

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
