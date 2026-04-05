return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			local treesitter = require("nvim-treesitter")

			treesitter.setup({
				highlight = {
					enable = true,
				},
				indent = { enable = true },
				autotag = { enable = true },
				ensure_installed = {
					"markdown",
					"markdown_inline",
					"json",
					"json5",
					"jsonc",
					"javascript",
					"typescript",
					"tsx",
					"html",
					"css",
					"bash",
					"lua",
					"vim",
					"cpp",
					"c",
					"python",
					"xml",
					"yaml",
					"swift",
					"sql",
					"dockerfile",
					"rust",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
				ignore_install = { "org" },
				auto_install = true,
			})
		end,
	},
}
