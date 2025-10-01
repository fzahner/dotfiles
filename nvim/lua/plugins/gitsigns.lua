return {
	"lewis6991/gitsigns.nvim",
	config = function()
		-- Setup at https://github.com/lewis6991/gitsigns.nvim?tab=readme-ov-file#installation--usage
		require("gitsigns").setup({
			current_line_blame = true,
		})
	end,
}
