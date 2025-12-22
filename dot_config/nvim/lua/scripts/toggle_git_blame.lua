-- toggles the gitsigns blame window
vim.api.nvim_create_user_command("ToggleGitBlame", function()
	-- Check all windows to find one with gitsigns-blame filetype
	local windows = vim.api.nvim_list_wins()
	local blame_window_found = false

	for _, win in ipairs(windows) do
		local buf = vim.api.nvim_win_get_buf(win)
		local filetype = vim.api.nvim_buf_get_option(buf, "filetype")

		if filetype == "gitsigns-blame" then
			-- Close the blame window
			vim.api.nvim_win_close(win, true)
			blame_window_found = true
			break
		end
	end

	-- If no blame window was found, run the Gitsigns blame command
	if not blame_window_found then
		vim.cmd("Gitsigns blame")
	end
end, {})
