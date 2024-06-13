return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>gf",
			function()
				require("conform").format({ async = false, lsp_fallback = true, timeout_ms = 500 })
			end,
			mode = "",
			desc = "format buffer",
		},
	},
	opts = {
		-- Formatters
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			markdown = { "prettier" },
			json = { "jq" },
			sh = { "shfmt" },
			c_sharp = { "csharpier" },
      sql = { "sqlformat" },
		},
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
