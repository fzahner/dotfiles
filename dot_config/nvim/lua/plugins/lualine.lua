return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto", --'gruvbox_dark',
				globalstatus = true, -- define one global line instead of for each window
				always_divide_middle = false,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					"diff",
					"diagnostics",
				},
				lualine_c = {
					{
						-- Lsp server name
						function()
							-- Function to turn numbers to subscript
							local function to_subscript(num)
								local subscript_map = {
									["0"] = "₀",
									["1"] = "₁",
									["2"] = "₂",
									["3"] = "₃",
									["4"] = "₄",
									["5"] = "₅",
									["6"] = "₆",
									["7"] = "₇",
									["8"] = "₈",
									["9"] = "₉",
								}
								return tostring(num):gsub(".", subscript_map)
							end
							local no_msg = "󰗞" -- when no active lsp
							local yes_msg = " "
							local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
							local clients = vim.lsp.get_clients()
							if next(clients) == nil then
								return no_msg
							end
							for _, client in ipairs(clients) do
								local filetypes = client.config.filetypes
								if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
									local client_string = client.name .. to_subscript(client.id)
									if string.len(yes_msg) >= 5 then
										yes_msg = yes_msg .. ", " .. client_string
									else
										yes_msg = yes_msg .. " " .. client_string
									end
								end
							end
							return yes_msg
						end,
					},
					{ -- active linters
						function()
							local linters = require("lint").get_running()
							if #linters == 0 then
								return "󰦕"
							end
							return "󱉶 " .. table.concat(linters, ", ")
						end,
					},
					{
						"filename",
						path = 1,
						shorting_target = 50,
						newfile_status = false,
						symbols = {
							modified = "", -- Text to show when the file is modified.
							readonly = "󱗑", -- Text to show when the file is non-modifiable or readonly.
							unnamed = "[No Name]", -- Text to show for unnamed buffers.
							newfile = "󰎔", -- Text to show for newly created file before first write
						},
					},
				},
				lualine_x = {
					{
						"progress",
						icon = { " Please display", align = "right", color = { fg = "green" } },
						draw_empty = true,
						color = { fg = "#ffaa88", bg = "grey" },
					},
				},
				lualine_y = { "encoding", "fileformat", { "filetype", colored = false } },
				lualine_z = { "location" },
			},
			extensions = { "mason", "toggleterm", "trouble" },
		})
	end,
}
