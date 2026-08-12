-- Bold
vim.keymap.set("i", "<C-b>", function()
	local line = vim.api.nvim_get_current_line()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	local after = line:sub(col + 1, col + 2)

	if after == "**" then
		return "<Right><Right>"
	else
		return "****<Left><Left>"
	end
end, { expr = true, buffer = true, desc = "Toggle **bold** markdown" })
vim.keymap.set("v", "<C-b>", "c**<Esc>pa**<Esc>", { buffer = true, desc = "**Bold** selection" })

-- Italic
-- Cant use C-i because it is used as tab 
vim.keymap.set("i", "<A-i>", function()
	local line = vim.api.nvim_get_current_line()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	local char_after = line:sub(col + 1, col + 1)

	if char_after == "_" then
		return "<Right>"
	else
		return "__<Left>"
	end
end, { expr = true, buffer = true, desc = "Toggle _italic_ markdown" })

-- Visual mode (uses register insertion instead of macro navigation)
vim.keymap.set("v", "<A-i>", 'c_<C-r>"_<Esc>', { buffer = true, desc = "Italic selection" })
