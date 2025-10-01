local wk = require("which-key")
local Terminal = require("toggleterm.terminal").Terminal
local buf = vim.api.nvim_buf_get_number(0)

-- Register the keymaps with which-key
wk.add({
	{ "<leader>c", buffer = buf, group = "HTML" },
	{
		"<leader>cc",
		"<cmd>TermExec cmd='live-server .' name='Live server'<cr>",
		buffer = buf,
		desc = "Start live server in toggleterm",
	},
})
