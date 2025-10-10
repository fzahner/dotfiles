local wk = require("which-key")
local buf = vim.api.nvim_buf_get_number(0)

wk.add({
	{ "<leader>c", buffer = buf, group = "VimTeX" },
	{ "<leader>cc", "<cmd>update<cr><cmd>VimtexCompile<cr>", buffer = buf, desc = "Compile" },
	{ "<leader>cs", "<cmd>update<cr><cmd>VimtexCompileSS<cr>", buffer = buf, desc = "Single shot compile" },
})
