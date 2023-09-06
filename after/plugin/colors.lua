function ColorMyPencils(color)
	color = color or "tokyonight"
	require("tokyonight").setup({style = "night",transparent=true,})
	vim.cmd.colorscheme(color)

end
ColorMyPencils()
