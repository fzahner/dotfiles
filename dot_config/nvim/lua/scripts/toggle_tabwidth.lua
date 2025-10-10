-- Changes between 2 and 4 spaces tabwidth
vim.api.nvim_create_user_command("ToggleTabwidth", function()
	if vim.o.shiftwidth == 4 then
		vim.o.shiftwidth = 2
		vim.o.smarttab = true
		print("Switched to shiftwidth=2 with smarttab")
	else
		vim.o.shiftwidth = 4
		vim.o.smarttab = true
		print("Switched to shiftwidth=4 with smarttab")
	end
end, {})
