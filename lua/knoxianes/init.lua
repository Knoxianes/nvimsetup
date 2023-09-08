require("knoxianes.remap")
require("knoxianes.set")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{"ThePrimeagen/vim-be-good",url="https://github.com/ThePrimeagen/vim-be-good"},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 999,
		opts = {},
	},
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{"ThePrimeagen/harpoon",ulr="https://github.com/ThePrimeagen/harpoon"},
	{"mbbill/undotree",url="https://github.com/mbbill/undotree"},
	{"tpope/vim-fugitive",url="https://github.com/tpope/vim-fugitive"},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	},
	{"windwp/nvim-ts-autotag",url="https://github.com/windwp/nvim-ts-autotag"},
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {"nvim-lualine/lualine.nvim",url="https://github.com/nvim-lualine/lualine.nvim"},
    {"lewis6991/gitsigns",url="https://github.com/lewis6991/gitsigns.nvim"},
   
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
})
