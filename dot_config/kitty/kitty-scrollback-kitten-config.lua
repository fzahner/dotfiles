vim.g.mapleader = " "
vim.g.maplocalleader = ","

--bootstrap lazy.vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/lazy/kitty-scrollback.nvim")

require("lazy").setup({
	{
		"mikesmithgh/kitty-scrollback.nvim",
		config = function()
			require("kitty-scrollback").setup({
				paste_window = {
					yank_register = "*",
					yank_register_enabled = true,
				},
				visual_selection_highlight_mode = "invert",
			})
		end,
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			local ns = require("neoscroll")
			ns.setup({ hide_cursor = true, easing = "linear" })
			local map = {
				["<C-u>"] = function()
					ns.ctrl_u({ duration = 250 })
				end,
				["<C-d>"] = function()
					ns.ctrl_d({ duration = 250 })
				end,
			}
			for k, f in pairs(map) do
				vim.keymap.set({ "n", "v", "x" }, k, f)
			end
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash TS",
			},
		},
	},
})
