return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("obsidian").setup({
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
				daily_notes = {
					directory = "/Users/jerrykingsbury/Personal/Daily",
					temmplate = nil,
				},
				completion = {
					nvim_cmp = true,
					min_chars = 2,
				},
				ui = { enable = false },
			})
		end,
	},
}
