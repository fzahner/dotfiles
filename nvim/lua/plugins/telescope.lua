return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"BurntSushi/ripgrep",
	},
	config = function()
		require("telescope").setup({
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						-- even more opts
					}),
				},
			},
		})
		require("telescope").load_extension("ui-select")
	end,
}
