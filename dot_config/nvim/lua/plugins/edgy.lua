return {
	"folke/edgy.nvim",
	enabled = false, -- disabled for the moment
	event = "VeryLazy",
	init = function()
		vim.opt.laststatus = 3
		vim.opt.splitkeep = "screen"
	end,
	opts = {
		animate = {
			enabled = false,
			fps = 100, -- frames per second
			cps = 120, -- cells per second
		},
		wo = {
			-- Setting to `true`, will add an edgy winbar.
			-- Setting to `false`, won't set any winbar.
			-- Setting to a string, will set the winbar to that string.
			winbar = false,
		},
		bottom = {
			-- toggleterm / lazyterm at the bottom with a height of 40% of the screen
			{
				ft = "toggleterm",
				size = { height = 0.35 },
				-- exclude floating windows
				filter = function(buf, win)
					return vim.api.nvim_win_get_config(win).relative == ""
				end,
			},
			{ -- lsps, problems
				ft = "trouble",
				size = { height = 0.35 },
				filter = function(_buf, win)
					return vim.w[win].trouble.mode == "diagnostics" or vim.w[win].trouble.mode == "lsp"
				end,
			},
		},
		left = {
			{
				ft = "NvimTree",
				size = { width = 0.15 },
			},
			{ -- symbols
				ft = "trouble",
				size = { height = 0.35 },
				filter = function(_buf, win)
					return vim.w[win].trouble.mode == "symbols"
				end,
			},
		},
		right = {

			{
				ft = "help",
				size = { width = 0.4 },
				-- only show help buffers
				filter = function(buf)
					return vim.bo[buf].buftype == "help"
				end,
			},
		},
	},
}
