return {
	"chomosuke/typst-preview.nvim",
	lazy = false, -- or ft = 'typst'
	version = "1.*",
	opts = {
		invert_colors = "always", -- 'always', 'never', 'auto'
		follow_cursor = true,
	}, -- lazy.nvim will implicitly calls `setup {}`
}
