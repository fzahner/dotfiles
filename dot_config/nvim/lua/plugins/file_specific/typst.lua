return {
	"chomosuke/typst-preview.nvim",
	ft = "typst", -- lazy = false
	version = "1.*",
	opts = {
		invert_colors = "auto", -- 'always', 'never', 'auto'
		follow_cursor = true,
	}, -- lazy.nvim will implicitly calls `setup {}`
}
