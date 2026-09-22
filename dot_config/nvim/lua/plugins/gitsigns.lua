return {
	"lewis6991/gitsigns.nvim",
	config = function()
		-- Setup at https://github.com/lewis6991/gitsigns.nvim?tab=readme-ov-file#installation--usage
		require("gitsigns").setup({
			current_line_blame = false,
		})
		local gitsigns = require("gitsigns")
		local timer = vim.uv.new_timer()

		-- Jump to next Git change with inline preview
		vim.keymap.set("n", "]h", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next")
				timer:start(
					100,
					0,
					vim.schedule_wrap(function()
						gitsigns.preview_hunk_inline()
					end)
				)
			end
		end, { desc = "Next Git change with inline preview" })

		-- Jump to previous Git change with inline preview
		vim.keymap.set("n", "[h", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
				timer:start(
					100,
					0,
					vim.schedule_wrap(function()
						gitsigns.preview_hunk_inline()
					end)
				)
			end
		end, { desc = "Previous Git change with inline preview" })
	end,
}
