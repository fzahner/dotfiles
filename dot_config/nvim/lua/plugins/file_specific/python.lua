return {
	"mfussenegger/nvim-dap-python",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		-- Path to the python interpreter in your global env or a specific venv
		-- If using mason, it's usually at ~/.local/share/nvim/mason/packages/debugpy/venv/bin/python
		require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
	end,
}
