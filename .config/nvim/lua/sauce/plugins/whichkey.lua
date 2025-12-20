return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		icons = {
			group = "", -- Remove the + icon before groups
		},
		spec = {
			-- Main leader groups - these show when you press <leader>
			{ "<leader>a", group = "AI/Claude", mode = { "n", "v" } },
			{ "<leader>b", group = "Buffer" },
			{ "<leader>c", group = "Code" },
			{ "<leader>d", group = "Debug/Diagnostics" },
			{ "<leader>e", group = "Explorer" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>h", group = "Harpoon/Hunks" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>m", group = "Format" },
			{ "<leader>n", group = "Notifications" },
			{ "<leader>s", group = "Search" },
			{ "<leader>t", group = "Tab" },
			{ "<leader>u", group = "UI/Toggle" },
			{ "<leader>w", group = "Window" },
			{ "<leader>x", group = "Trouble/Diagnostics" },
			{ "<leader>z", group = "Zen" },
		},
		-- Adjust delay to prevent immediate expansion
		delay = 200,
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
