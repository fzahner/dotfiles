local wk = require("which-key")
local buf = vim.api.nvim_buf_get_number(0)

wk.add({
	{ "<leader>c", buffer = buf, group = "Typst" },
	{ "<leader>cc", "<cmd>update<cr><cmd>TypstPreviewToggle<cr>", buffer = buf, desc = "Show Preview" },
	{
		"<leader>cf",
		"<cmd>update<cr><cmd>TypstPreviewFollowCursorToggle<cr>",
		buffer = buf,
		desc = "Toggle follow cursor",
	},
})
