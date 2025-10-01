return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "classic", -- modern, helix, classic
		win = {
			padding = { 1, 2 },
		},
		triggers = {
			{ "<auto>", mode = "nixo" },
			-- Custom triggers for marks
			{ "m", mode = "ni" },
			-- Custom triggers for surround
			{ "ys", mode = "ni" },
			{ "ds", mode = "ni" },
			{ "cs", mode = "ni" },
		},
	},
}
