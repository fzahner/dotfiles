return {
	"zaldih/themery.nvim",
	config = function()
		require("themery").setup({
			themes = {
				"default",
				"kanagawa-lotus",
				"kanagawa-dragon",
				"kanagawa-wave",
				"everforest",
				"catppuccin-frappe",
				"catppuccin-latte",
				"catppuccin-macchiato",
				"catppuccin-mocha",
				{
					name = "gruvbox dark",
					colorscheme = "gruvbox",
					before = [[
            -- All this block will be executed before apply "set colorscheme"
            -- vim.opt.background = "dark"
          ]],
				},
				{
					name = "gruvbox material",
					colorscheme = "gruvbox-material",
				},
			},
			livePreview = true, -- Apply theme while picking. Default to true.
		})
	end,
}
