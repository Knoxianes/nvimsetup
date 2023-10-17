require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {"javascript","typescript", "c", "lua", "vim", "vimdoc", "html","python","go","css" },
	sync_install = false,
    autotag = {
        enable = true
    },

	highlight = {
		enable = true,

		additional_vim_regex_highlighting = false,
	},
}
