local wk = require("which-key")
local buf = vim.api.nvim_buf_get_number(0)

wk.add({
	{ "<leader>c", buffer = buf, group = "Python" },
	{
		"<leader>cc",
		"<cmd>!python3 %<cr>",
		buffer = buf,
		desc = "Run without terminal",
	},
	{
		"<leader>ct",
		"<cmd>TermExec cmd='python3 %' name='PythonRun'<cr>",
		buffer = buf,
		desc = "Run with terminal",
	},
})
