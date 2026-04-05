local function mason_bin(executable)
	local path = vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "bin", executable)

	if vim.fn.executable(path) == 1 then
		return path
	end

	return executable
end

local function map(bufnr, mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
end

local function apply_source_action(action_kind)
	return function()
		vim.lsp.buf.code_action({
			apply = true,
			context = {
				only = { action_kind },
				diagnostics = {},
			},
		})
	end
end

return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "folke/lazydev.nvim", opts = {} },
		},
		config = function()
			local ok, blink = pcall(require, "blink.cmp")
			local capabilities = ok and blink.get_lsp_capabilities() or vim.lsp.protocol.make_client_capabilities()

			vim.diagnostic.config({
				underline = true,
				severity_sort = true,
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "●",
				},
				float = {
					border = "rounded",
					source = "if_many",
				},
			})

			local attach_group = vim.api.nvim_create_augroup("sauce-lsp-attach", { clear = true })
			vim.api.nvim_create_autocmd("LspAttach", {
				group = attach_group,
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					local bufnr = args.buf

					if not client then
						return
					end

					map(bufnr, "n", "gd", vim.lsp.buf.definition, "Goto Definition")
					map(bufnr, "n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
					map(bufnr, "n", "gr", vim.lsp.buf.references, "References")
					map(bufnr, "n", "gi", vim.lsp.buf.implementation, "Goto Implementation")
					map(bufnr, "n", "K", vim.lsp.buf.hover, "Hover")
					map(bufnr, "n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
					map(bufnr, "n", "<leader>cr", vim.lsp.buf.rename, "Rename Symbol")

					if client:supports_method("textDocument/inlayHint") then
						vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
					end

					if client.name == "vtsls" then
						map(
							bufnr,
							"n",
							"<leader>ci",
							apply_source_action("source.addMissingImports.ts"),
							"Add Missing Imports"
						)
						map(bufnr, "n", "<leader>co", apply_source_action("source.organizeImports"), "Organize Imports")
					end
				end,
			})

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.lsp.config("lua_ls", {
				cmd = { mason_bin("lua-language-server") },
				on_init = function(client)
					if not client.workspace_folders then
						return
					end

					local path = client.workspace_folders[1].name
					if
						path ~= vim.fn.stdpath("config")
						and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
					then
						return
					end

					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua or {}, {
						runtime = {
							version = "LuaJIT",
							path = {
								"lua/?.lua",
								"lua/?/init.lua",
							},
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
							},
						},
					})
				end,
			})

			vim.lsp.config("vtsls", {
				cmd = { mason_bin("vtsls"), "--stdio" },
				settings = {
					vtsls = {
						autoUseWorkspaceTsdk = true,
						experimental = {
							completion = {
								enableServerSideFuzzyMatch = true,
								entriesLimit = 200,
							},
						},
					},
					typescript = {
						inlayHints = {
							enumMemberValues = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							parameterNames = { enabled = "literals" },
							parameterTypes = { enabled = true },
							propertyDeclarationTypes = { enabled = true },
							variableTypes = { enabled = false },
						},
						preferences = {
							includeCompletionsForModuleExports = true,
							includeCompletionsForImportStatements = true,
							includeCompletionsWithInsertText = true,
							includeCompletionsWithSnippetText = true,
							includePackageJsonAutoImports = "auto",
							importModuleSpecifierPreference = "project-relative",
							quoteStyle = "auto",
						},
						suggest = {
							completeFunctionCalls = true,
						},
						updateImportsOnFileMove = {
							enabled = "always",
						},
					},
					javascript = {
						inlayHints = {
							enumMemberValues = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							parameterNames = { enabled = "literals" },
							parameterTypes = { enabled = true },
							propertyDeclarationTypes = { enabled = true },
							variableTypes = { enabled = false },
						},
						preferences = {
							includeCompletionsForModuleExports = true,
							includeCompletionsForImportStatements = true,
							includeCompletionsWithInsertText = true,
							includeCompletionsWithSnippetText = true,
							includePackageJsonAutoImports = "auto",
							importModuleSpecifierPreference = "project-relative",
							quoteStyle = "auto",
						},
						suggest = {
							completeFunctionCalls = true,
						},
						updateImportsOnFileMove = {
							enabled = "always",
						},
					},
				},
			})

			vim.lsp.config("rust_analyzer", {
				cmd = { mason_bin("rust-analyzer") },
			})

			vim.lsp.config("basedpyright", {
				cmd = { mason_bin("basedpyright-langserver"), "--stdio" },
				settings = {
					basedpyright = {
						analysis = {
							autoImportCompletions = true,
							autoSearchPaths = true,
							diagnosticMode = "openFilesOnly",
							typeCheckingMode = "basic",
							useLibraryCodeForTypes = true,
						},
					},
				},
			})

			for _, server in ipairs({ "lua_ls", "vtsls", "rust_analyzer", "basedpyright" }) do
				vim.lsp.enable(server)
			end
		end,
	},
}
