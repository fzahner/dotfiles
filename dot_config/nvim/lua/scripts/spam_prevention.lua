-- This file, when activated, prevents spamming of a certain key in normal mode.
-- My goal with this file is to encourage the use of the proper vim motions, instead of getting to where I want by just spamming keys.
local last_char = ""
local count = 0
local last_time = 0
local threshold = 0.25 -- seconds
local repeat_limit = 3

vim.on_key(function(char)
	if vim.api.nvim_get_mode().mode ~= "n" then
		return
	end

	local now = vim.loop.hrtime() / 1e9

	if char == last_char and (now - last_time) < threshold then
		count = count + 1
		if count >= repeat_limit then
			require("noice").notify("Stop spamming '" .. char .. "'", "warn")
			count = 0
		end
	else
		count = 1
		last_char = char
	end

	last_time = now
end)
