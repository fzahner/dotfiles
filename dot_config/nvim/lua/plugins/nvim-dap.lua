return {
	{
		"mfussenegger/nvim-dap",
		version = "0.10",
		event = "VeryLazy",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"jay-babu/mason-nvim-dap.nvim",
			"theHamsta/nvim-dap-virtual-text",
		},
	},
	{
		{
			"jay-babu/mason-nvim-dap.nvim",
			dependencies = {
				"mfussenegger/nvim-dap",
				"williamboman/mason.nvim",
			},
			opts = {
				handlers = {
					function(config)
						require("mason-nvim-dap").default_setup(config)
					end,
				},
				automatic_installation = {
					exclude = {},
				},
				ensure_installed = { "delve" },
			},
		},
	},
}
