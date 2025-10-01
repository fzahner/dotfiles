return {
	{

		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	-- Not used as plugin also displays whichkey guides for sequence <leader>s... (in my case used for settings)
	-- {
	-- 	"roobert/surround-ui.nvim",
	-- 	dependencies = {
	-- 		"kylechui/nvim-surround",
	-- 		"folke/which-key.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("surround-ui").setup({
	-- 			root_key = "s",
	-- 		})
	-- 	end,
	-- },
}
