-- Handles autoformatting
vim.g.autosave = false

local augroup = vim.api.nvim_create_augroup("__autosave__", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	group = augroup,
	callback = function()
		if vim.g.autosave then
			vim.cmd("silent! w")
		end
	end,
})

vim.api.nvim_create_user_command("ToggleAutoSave", function()
	vim.g.autosave = not vim.g.autosave
	print("Autosave " .. (vim.g.autosave and "enabled" or "disabled"))
end, {})
