return {
	"karb94/neoscroll.nvim",
	config = function()
		require("neoscroll").setup({
			hide_cursor = true, -- Hide cursor while scrolling
			stop_eof = true, -- Stop at <EOF> when scrolling downwards
			respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
			cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
			easing = "linear", -- Default easing function
			pre_hook = nil, -- Function to run before the scrolling animation starts
			post_hook = nil, -- Function to run after the scrolling animation ends
			performance_mode = false, -- Disable "Performance Mode" on all buffers.
			ignored_events = { -- Events ignored while scrolling
				"WinScrolled",
				"CursorMoved",
			},
		})
		neoscroll = require("neoscroll")
		local keymap = {
			["<C-u>"] = function()
				neoscroll.ctrl_u({ duration = 250 })
			end,
			["<C-d>"] = function()
				neoscroll.ctrl_d({ duration = 250 })
			end,
			["<C-b>"] = function()
				neoscroll.ctrl_b({ duration = 400, easing = "sine" })
			end,
			["<C-f>"] = function()
				neoscroll.ctrl_f({ duration = 400, easing = "sine" })
			end,
			["zt"] = function()
				neoscroll.zt({ half_win_duration = 250, easing = "sine" })
			end,
			["zz"] = function()
				neoscroll.zz({ half_win_duration = 250, easing = "sine" })
			end,
			["zb"] = function()
				neoscroll.zb({ half_win_duration = 250, easing = "sine" })
			end,
		}
		local modes = { "n", "v", "x" }
		for key, func in pairs(keymap) do
			vim.keymap.set(modes, key, func)
		end
	end,
}
