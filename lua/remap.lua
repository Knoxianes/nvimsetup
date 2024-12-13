vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'Open explorer' })
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "i", "v" }, "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>f",
    function()
        MiniTrailspace.trim()
        MiniTrailspace.trim_last_lines()
    end
    ,
    { desc = "MiniTrailSpace trim" })

-- vim.keymap.set("n", "<leader>q", "<cmd>EslintFixAll<CR>", { desc = "ESLint fix all" })



vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Disable arrow keys
vim.keymap.set({ 'n', 'v', 'i' }, '<Left>', '<Nop>')
vim.keymap.set({ 'n', 'v', 'i' }, '<Right>', '<Nop>')
vim.keymap.set({ 'n', 'v', 'i' }, '<Down>', '<Nop>')
vim.keymap.set({ 'n', 'v', 'i' }, '<Up>', '<Nop>')
vim.keymap.set({ 'n', 'v', 'i' }, '<PageDown>', '<Nop>')
vim.keymap.set({ 'n', 'v', 'i' }, '<PageUp>', '<Nop>')

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')


vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
