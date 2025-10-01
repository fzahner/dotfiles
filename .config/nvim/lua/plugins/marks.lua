return {
	"chentoast/marks.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		-- Manual which-key defines
		local wk = require("which-key")
		wk.add({
			-- Main marks group
			{ "m", group = "Marks" },
			{ "mx", desc = "Set mark x" },
			{ "m,", desc = "Set next available mark" },
			{ "m;", desc = "Toggle next available mark" },
			{ "m]", desc = "Move to next mark" },
			{ "m[", desc = "Move to previous mark" },
			{ "m:", desc = "Preview mark" },
			{ "m}", desc = "Next bookmark (same type)" },
			{ "m{", desc = "Previous bookmark (same type)" },
			{ "m0", desc = "Add group 0 (annotate)" },
			{ "m1", desc = "Add group 1 (TODO)" },
			{ "m2", desc = "Add group 2 (Done)" },
			{ "m3", desc = "Add group 3" },
			{ "m4", desc = "Add group 4" },
			{ "m5", desc = "Add group 5" },
			{ "m6", desc = "Add group 6" },
			{ "m7", desc = "Add group 7" },
			{ "m8", desc = "Add group 8" },
			{ "m9", desc = "Add group 9" },

			-- Delete marks group
			{ "dm", group = "Delete Marks" },
			{ "dmx", desc = "Delete mark x" },
			{ "dm-", desc = "Delete all marks on current line" },
			{ "dm<space>", desc = "Delete all marks in buffer" },
			{ "dm=", desc = "Delete bookmark under cursor" },
			{ "dm0", desc = "Delete group 0" },
			{ "dm1", desc = "Delete group 1" },
			{ "dm2", desc = "Delete group 2" },
			{ "dm3", desc = "Delete group 3" },
			{ "dm4", desc = "Delete group 4" },
			{ "dm5", desc = "Delete group 5" },
			{ "dm6", desc = "Delete group 6" },
			{ "dm7", desc = "Delete group 7" },
			{ "dm8", desc = "Delete group 8" },
			{ "dm9", desc = "Delete group 9" },
		})
		require("marks").setup({
			-- whether to map keybinds or not. default true
			default_mappings = true,
			-- which builtin marks to show. default {}
			builtin_marks = { ".", "<", ">", "^" },
			refresh_interval = 250,
			sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
			excluded_filetypes = { "NvimTree", "DressingInput" },
			-- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
			-- sign/virttext. Bookmarks can be used to group together positions and quickly move
			-- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
			-- default virt_text is "".
			bookmark_0 = {
				sign = "󰙆",
				-- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
				-- defaults to false.
				annotate = true,
			},
			bookmark_1 = {
				sign = "󰄗",
				virt_text = "TODO",
			},
			bookmark_2 = {
				sign = "",
				virt_text = "Done",
			},
		})
	end,
}
