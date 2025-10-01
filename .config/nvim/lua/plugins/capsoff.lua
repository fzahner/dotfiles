return {
	-- Sets caps lock to off when leaving INSERT mode
	"zongben/capsoff.nvim",
	build = ":CapsLockOffBuild",
	config = function()
		require("capsoff").setup()
	end,
}
