return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
				},
				-- enable indentation
				indent = { enable = true },
				-- enable autotagging (w/ nvim-ts-autotag plugin)
				autotag = { enable = true },
				-- ensure these language parsers are installed
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
					"c_sharp",
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
					"go",
					"gomod",
					"gowork",
					"gosum",
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
