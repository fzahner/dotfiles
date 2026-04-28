return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		-- Adapters for the languages
		"nvim-neotest/neotest-python",
		"nvim-neotest/neotest-go",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					dap = { adapter = "python" }, -- Connects it to nvim-dap
				}),
				require("neotest-go"),
			},
		})
	end,
}

-- FOR DEBUGGING TO WORK FOR A LANGUAGE:
-- 1. Install the adapter for that language (e.g., neotest-python) here in dependencies and add to setup()
-- 2. Install the corresponding nvim-dap adapter (e.g., nvim-dap-python) in file_specific/
-- 3. Download treesitter parser for that language (e.g., :TSInstall python)
