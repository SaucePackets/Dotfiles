return {
	"nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
                require("none-ls.code_actions.eslint"),
                require("none-ls.diagnostics.cpplint"),
                require("none-ls.formatting.jq"),
                null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.gofmt,
				null_ls.builtins.formatting.csharpier,
				null_ls.builtins.hover.dictionary,
                null_ls.builtins.completion.spell,
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
