return {
	{
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
		dependencies = {

			"williamboman/mason.nvim",
			"rshkarin/mason-nvim-lint",
		},
		config = function()
			-- Lint on safe
			vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter", "BufWritePost" }, {
				callback = function()
					-- try_lint without arguments runs the linters defined in `linters_by_ft for the current filetype
					require("lint").try_lint()
				end,
			})

			require("lint").linters_by_ft = {
				html = { "htmlhint" },
				javascript = { "eslint_d" },
			}
		end,
	},
	{
		"rshkarin/mason-nvim-lint",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-nvim-lint").setup({
				automatic_installation = true,
			})
		end,
	},
}
