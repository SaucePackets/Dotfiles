return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			{ "williamboman/mason-lspconfig.nvim", opts = { auto_install = true } },
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { { "folke/neodev.nvim", opts = {} } },

		config = function()
			local lspconfig = require("lspconfig")

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Buffer local mappings

					-- Show documentation for what is under the cursor
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true, buffer = ev.buffer })

					-- Show lsp references
					vim.keymap.set(
						"n",
						"<leader>gR",
						"<cmd>Telescope lsp_references<CR>",
						{ silent = true, buffer = ev.buffer }
					)

					-- Go to declaration
					vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { silent = true, buffer = ev.buffer })

					-- Show lsp definition
					vim.keymap.set(
						"n",
						"<leader>gd",
						"<cmd>Telescope lsp_definitions<CR>",
						{ silent = true, buffer = ev.buffer }
					)

					-- Show lsp implementations
					vim.keymap.set(
						"n",
						"<leader>gi",
						"<cmd>Telescope lsp_implementations<CR>",
						{ silent = true, buffer = ev.buffer }
					)

					-- Show lsp type definitions
					vim.keymap.set(
						"n",
						"<leader>gt",
						"<cmd>Telescope lsp_type_definitions<CR>",
						{ silent = true, buffer = ev.buffer }
					)

					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { silent = true, buffer = ev.buffer })

					-- Smart rename
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { silent = true, buffer = ev.buffer })

					-- Show buffer diagnostics for file
					vim.keymap.set(
						"n",
						"<leader>D",
						"<cmd>Telescope diagnostics bufnr=0<CR>",
						{ silent = true, buffer = ev.buffer }
					)

					-- Go to previous diagnostic
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { silent = true, buffer = ev.buffer })

					-- Go to next diagnostic
					vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { silent = true, buffer = ev.buffer })

					-- Restart lsp
					vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", { silent = true, buffer = ev.buffer })
				end,
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Default handler to automatically install servers
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,

        -- Manually declare servers down here if need to
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
				["omnisharp"] = function()
					lspconfig.omnisharp.setup({
						capabilities = capabilities,
						cmd = {
							"omnisharp",
							"--languageserver",
							"--hostPID",
							tostring(vim.fn.getpid()),
						},
						handlers = {
							["textDocument/definition"] = function(...)
								return require("omnisharp_extended").handler(...)
							end,
						},
						enable_roslyn_analyzers = true,
						organize_imports_on_format = true,
						enable_import_completion = true,
						enable_decompilation_support = true,
					})
				end,
			})
		end,
	},
	-- C#
	{
		"Hoffs/omnisharp-extended-lsp.nvim",
		Lazy = true,
	},
}
