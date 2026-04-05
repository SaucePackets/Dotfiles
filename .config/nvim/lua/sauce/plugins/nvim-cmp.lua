return {
	"saghen/blink.cmp",
	version = "1.*",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"rafamadriz/friendly-snippets",
	},
	opts = function()
		require("luasnip.loaders.from_vscode").lazy_load()
		require("sauce.snippets").setup()
		vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }

		return {
			keymap = {
				preset = "default",
				["<C-j>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
				["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
				["<CR>"] = { "accept", "fallback" },
			},
			snippets = {
				preset = "luasnip",
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},
				trigger = {
					prefetch_on_insert = true,
					show_in_snippet = true,
					show_on_backspace = true,
					show_on_backspace_in_keyword = true,
					show_on_insert = true,
					show_on_keyword = true,
					show_on_trigger_character = true,
					show_on_accept_on_trigger_character = true,
					show_on_insert_on_trigger_character = true,
					show_on_x_blocked_trigger_characters = { "'", "\"", "(" },
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 150,
					window = {
						border = "rounded",
					},
				},
				ghost_text = {
					enabled = true,
				},
				list = {
					selection = {
						preselect = false,
						auto_insert = false,
					},
				},
				menu = {
					border = "rounded",
					draw = {
						columns = {
							{ "kind_icon" },
							{ "label", "label_description", gap = 1 },
							{ "kind" },
							{ "source_name" },
						},
					},
				},
			},
			signature = {
				enabled = true,
				window = {
					border = "rounded",
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				per_filetype = {
					lua = { "lazydev", "lsp", "path", "snippets", "buffer" },
				},
				providers = {
					lsp = {
						fallbacks = { "buffer" },
					},
					path = {
						score_offset = 3,
					},
					snippets = {
						score_offset = 4,
						opts = {
							use_show_condition = true,
							show_autosnippets = true,
						},
					},
					buffer = {
						score_offset = -3,
					},
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
			fuzzy = {
				implementation = "prefer_rust_with_warning",
			},
			cmdline = {
				enabled = true,
				keymap = { preset = "cmdline" },
				sources = function()
					local cmd_type = vim.fn.getcmdtype()
					if cmd_type == ":" or cmd_type == "@" then
						return { "cmdline", "buffer" }
					end

					return { "buffer" }
				end,
			},
		}
	end,
}
