return {
	"L3MON4D3/LuaSnip",
	event = "InsertEnter",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		local ls = require("luasnip")

		-- Avoids behaviour where luasnip expandOrJumps are not consumed and then jump back on next tab use
		ls.config.set_config({
			region_check_events = "InsertEnter",
			delete_check_events = "InsertLeave",
		})

		vim.keymap.set({ "i" }, "<A-k>", function()
			ls.jump(1)
		end, { silent = true })
		vim.keymap.set({ "i" }, "<A-j>", function()
			ls.jump(-1)
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-E>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true })

		-------------- Filetype suggestions extensions ------------------
		--- Enable html snippets in JS & PHP
		require("luasnip").filetype_extend("javascript", { "html" })
		require("luasnip").filetype_extend("typescript", { "html" })
		require("luasnip").filetype_extend("javascriptreact", { "html" })
		require("luasnip").filetype_extend("typescriptreact", { "html" })
		require("luasnip").filetype_extend("vue", { "html" })
		require("luasnip").filetype_extend("php", { "html" })

		-------------- Custom snippets --------------

		--- class/className completion (HTML, JS)
		ls.add_snippets("html", {
			ls.snippet({
				trig = "%.([%w-]+)",
				regTrig = true,
				name = "div with dynamic class",
				dscr = "Create a div with dynamic class",
			}, {
				ls.function_node(function(_, snip)
					return string.format('<div class="%s">', snip.captures[1])
				end),
				ls.insert_node(0),
				ls.text_node({ "</div>" }),
			}),
		})

		-- html comments
		ls.add_snippets("html", {
			ls.snippet("comment", {
				ls.text_node("<!-- "),
				ls.insert_node(1),
				ls.text_node(" -->"),
				ls.insert_node(0),
			}),
		})

		-----------------------------------------------

		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
