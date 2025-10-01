return {
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },
		},

		config = function()
			-- LSP Setup is handeled by mason-lspconfig handlers
			vim.diagnostic.config({
				virtual_text = true,
			})
		end,
	},
	{

		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"html",
					"rust_analyzer",
					"texlab",
					"ts_ls",
					"marksman",
					"cssls",
					"pylsp", -- requires flake8 linter installed
					-- "sqls",

					-- Spellchecker
					"harper_ls",
					"textlsp",
				}, -- all LSPs
				automatic_installation = true,
			})
			local lspconfig = require("lspconfig")

			-------- LSP Setups ------------
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			vim.lsp.config("html", {
				capabilities = capabilities,
				filetypes = { "html", "vue" },
			})

			vim.lsp.config("cssls", {
				capabilities = capabilities,
			})

			vim.lsp.config("pslsp", {
				settings = {
					pylsp = {
						configurationSources = { "flake8" },
						plugins = {
							pycodestyle = { enabled = false },
							pyflakes = { enabled = false },
							mccabe = { enabled = false },
							flake8 = { enabled = true },
						},
					},
				},
			})

			vim.lsp.config("ts_ls", {
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = "/usr/local/lib/node_modules/@vue/typescript-plugin", -- or use a dummy path if installed locally
							languages = { "javascript", "typescript", "vue", "typescriptreact" },
						},
					},
				},
				filetypes = { "javascript", "typescript", "vue", "typescriptreact" },
			})
		end,
	},
}
