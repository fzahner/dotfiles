return {
	{
		"morhetz/gruvbox",
		lazy = true,
	}, -- original gruvbox
	{
		"sainnhe/gruvbox-material", -- gruvbox material
		lazy = true,
		config = function()
			vim.g.gruvbox_material_enable_italic = true
			vim.g.gruvbox_material_enable_bold = true
		end,
	},
}
