return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "Personal",
				path = "/Users/jerrykingsbury/Personal",
			},
			{
				name = "Software Engineering Notes",
				path = "/Users/jerrykingsbury/Library/Mobile Documents/iCloud~md~obsidian/Documents/SoftwareEngineering",
			},
		},

		completion = {
			nvim_cmp = true,
		},
	},
	daily_notes = {
		directory = "/Users/jerrykingsbury/Personal/Daily",
		temmplate = nil,
	},
}
