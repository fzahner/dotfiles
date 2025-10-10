return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				view = {
					width = 40,
					side = "left",
					relativenumber = true,
				},
				filters = {
					dotfiles = false,
					git_ignored = false,
				},
			})
			-- -- Crossclip attachement
			-- local function on_attach(bufnr)
			-- 	local clip = require("nvim-tree-crossclip")
			-- 	vim.keymap.set("n", "c", clip.copy_toggle, { buffer = bufnr, desc = "CrossClip: toggle copy" })
			-- 	vim.keymap.set("n", "x", clip.cut_toggle, { buffer = bufnr, desc = "CrossClip: toggle cut" })
			-- 	vim.keymap.set("n", "p", clip.paste, { buffer = bufnr, desc = "CrossClip: paste" })
			-- end
			--
			-- require("nvim-tree").setup({
			-- 	on_attach = on_attach,
			-- })
		end,
	},
	-- {
	-- 	"leonardcser/nvim-tree-crossclip.nvim",
	-- 	dependencies = "nvim-tree/nvim-tree.lua",
	-- 	name = "nvim-tree-crossclip",
	-- 	config = function()
	-- 		require("nvim-tree-crossclip").setup({
	-- 			persistent_clipboard = true, -- set to false to clear clipboard on exit and skip decoration restore
	-- 		})
	-- 	end,
	-- },
}
