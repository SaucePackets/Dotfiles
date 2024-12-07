return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts_extend = { "spec" },
	opts = {
		defaults = {},
		spec = {
			{
				mode = { "n", "v" },
				{ "<leader><tab>", group = "tabs" },
				{ "<leader>c", group = "code" },
				{ "<leader>f", group = "file/find" },
				{ "<leader>g", group = "git" },
				{ "<leader>gh", group = "hunks" },
				{ "<leader>h", group = "harpoon", icon = { icon = "", color = "cyan" }},
				{ "<leader>q", group = "quit/session" },
        { "<leader>r", group = "lsp" },
				{ "<leader>s", group = "noice/telescope browser" },
				{ "<leader>t", group = "tab" },
				{ "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
				{ "<leader>w", group = "window", icon = { icon = "", color = "indigo" } },
				{ "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
				{ "[", group = "prev" },
				{ "]", group = "next" },
				{ "g", group = "goto" },
				{ "gs", group = "surround" },
				{ "z", group = "fold" },
			},
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Keymaps (which-key)",
		},
		{
			"<c-w><space>",
			function()
				require("which-key").show({ keys = "<c-w>", loop = true })
			end,
			desc = "Window Hydra Mode (which-key)",
		},
	},
}
