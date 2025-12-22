return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	build = "make",
	opts = {
		provider = "copilot",
		providers = {
			ollama = {
				endpoint = "http://localhost:11434",
				model = "qwen2.5-coder:0.5b",
			},
		},
		shortcuts = {
			{
				name = "from-notes-to-text",
				description = "Generate full technical text from notes.",
				details = "Generate a full-length technical text from the provided notes and context. Only edits the selected text.",
				prompt = "When recieving this prompt, first, output: I WILL CONVERT TO TEXT ACCORDING TO THE GIVEN INSTRUCTIONS. Then: From the given notes I have written and the other context I have provided, write a full-length text. You may change words, wording, or order of all points. You may leave out details or combine them with other details where you think it is beneficial. If available, use styling elements of the language you are writing in (LaTeX, Markdown, ...) where beneficial. If you think some more information could result in a better text, ask me and I will provide context. Do not use unnecessary filler words or long sentences that do not provide much value. The style should be like a technical report/paper, but do not use unnecessarily strung-out sentences. Do not use unnecessarily complicated words, use normal language if no complicated words are required. Only edit/replace the selected text. ",
			},
			-- Add more custom shortcuts...
		},
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		-- "zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
