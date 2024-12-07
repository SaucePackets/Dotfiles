return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			{ "williamboman/mason-lspconfig.nvim", opts = { auto_install = true } },
			"WhoIsSethDaniel/mason-tool-installer.nvim",
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

			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"pyright",
					"emmet_ls",
					"lua_ls",
					"html",
					"cssls",
					"tailwindcss",
				},
			})

			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier",
					"isort",
					"black",
					"stylua",
					"csharpier",
					"jq",
					"shfmt",
					"eslint_d",
					"pylint",
					"sqlfluff",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },

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

					vim.keymap.set(
						{ "n", "v" },
						"<leader>ca",
						vim.lsp.buf.code_action,
						{ silent = true, buffer = ev.buffer }
					)

					-- Smart rename
					-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { silent = true, buffer = ev.buffer })

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

			local ok, mason_registry = pcall(require, "mason-registry")
			if not ok then
				vim.notify("mason-registry could not be loaded")
				return
			end
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
				["emmet_ls"] = function()
					-- configure emmet language server
					lspconfig["emmet_ls"].setup({
						capabilities = capabilities,
						filetypes = {
							"html",
							"typescriptreact",
							"javascriptreact",
							"css",
							"sass",
							"scss",
							"less",
							"svelte",
						},
					})
				end,
				-- TODO: Setup Angular LSP
				-- ["angular-language-server"] = function()
				-- 	local angularls_path = mason_registry.get_package("angular-language-server"):get_install_path()
				-- 	local cmd = {
				-- 		"ngserver",
				-- 		"--stdio",
				-- 		table.concat({
				-- 			angularls_path,
				-- 			vim.uv.cwd(),
				-- 		}, ","),
				-- 		"--ngProbeLocations",
				-- 		table.concat({
				-- 			angularls_path .. "/node_modules/@angular/language-server",
				-- 			vim.uv.cwd(),
				-- 		}, ","),
				-- 	}
				-- 	lspconfig.angularls.setup({
				-- 		capabilities = capabilities,
				-- 		on_new_config = function(new_config, new_root_dir)
				-- 			new_config.cmd = cmd
				-- 		end,
				-- 		-- root_dir = require("lspconfig").util.root_pattern("angular.json", ".git"),
				-- 	})
				-- end,
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
				["gopls"] = function()
					lspconfig.gopls.setup({
						capabilities = capabilities,
						settings = {
							gopls = {
								gofumpt = true,
								analyses = {
									unusedparams = true,
									nilness = true,
								},
								codelenses = {
									generate = true,
									test = true,
								},
								hints = {
									assignVariableTypes = true,
									parameterNames = true,
								},
								completeUnimported = true,
								directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
								semanticTokens = true,
							},
						},
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
