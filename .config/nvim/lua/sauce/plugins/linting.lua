if true then
	return {}
end

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "pylint" },
		}

		vim.diagnostic.config({
			virtual_text = false, -- important: avoid inline spam
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				border = "rounded",
				source = "always",
			},
		})

		local lint_augroup = vim.api.nvim_create_augroup("Linting", { clear = true })

		local function try_lint()
			lint.try_lint()
		end

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = try_lint,
		})

		vim.keymap.set("n", "<leader>l", try_lint, {
			desc = "Trigger linting for current file",
		})

		vim.api.nvim_create_autocmd("CursorHold", {
			callback = function()
				vim.diagnostic.open_float(nil, { focus = false })
			end,
		})
	end,
}
