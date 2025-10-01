return {
	"shortcuts/no-neck-pain.nvim",
	version = "*",
	config = function()
		require("no-neck-pain").setup({
			buffers = {
				scratchPad = {
					enabled = true,
					location = ".", -- current working directory
				},
				bo = {
					filetype = "md",
				},
			},
			integrations = {
				NvimTree = {
					position = "left",
					reopen = false,
				},
			},
		})
	end,
}
