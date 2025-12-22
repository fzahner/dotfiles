local M = {}

local function same_pos(a, b)
	return a[1] == b[1] and a[2] == b[2]
end

M.next_error_then_hint = function()
	local before = vim.api.nvim_win_get_cursor(0)
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR, wrap = true })
	local after = vim.api.nvim_win_get_cursor(0)

	if same_pos(before, after) then
		vim.diagnostic.goto_next({ wrap = true })
	end
end

M.prev_error_then_hint = function()
	local before = vim.api.nvim_win_get_cursor(0)
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR, wrap = true })
	local after = vim.api.nvim_win_get_cursor(0)

	if same_pos(before, after) then
		vim.diagnostic.goto_prev({ wrap = true })
	end
end

return M
