return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
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
					"latex",
					"xml",
					"yaml",
					"swift",
					"sql",
				},
				ignore_install = { "org" },
				-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
				-- context_commentstring = {
				--   enable = true,
				--   enable_autocmd = false,
				-- },
				-- auto install above language parsers
				auto_install = true,
			})
		end,
	},
}
