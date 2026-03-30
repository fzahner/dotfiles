return {
	"MagicDuck/grug-far.nvim",
	-- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
	-- additional lazy config to defer loading is not really needed...
	config = function()
		require("grug-far").setup({
			-- options, see Configuration section below
			-- there are no required options atm
		})
	end,
}
