return {
	{
		enabled = false,
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function(_, opts)
			require("go").setup({
				lsp_document_formatting = true,
				lsp_cfg = true, -- enable built-in LSP config (uses gopls)
				lsp_gofumpt = true, -- use gofumpt for formatting
				lsp_on_attach = true,
				lsp_codelens = true,
				formatter = "gofumpt", -- optional
			})

			local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.go",
				callback = function()
					require("go.format").goimports()
				end,
				group = format_sync_grp,
			})
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()',
	},
	{
		"leoluz/nvim-dap-go",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("dap-go").setup({
				delve = {
					path = "dlv",
				},
			})
		end,
	},
}
