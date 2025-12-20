return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			event_handlers = {
				{
					event = "file_opened",
					handler = function(_)
						-- auto close
						require("neo-tree.command").execute({
							action = "close",
						})
					end,
				},
			},
			window = {
				position = "left",
			},
		})
	end,
	keys = {
		{ "<leader>bf", ":Neotree buffers reveal float<cr>", desc = "Shows Neotree buffers" },
		{ "<leader>ee", ":Neotree toggle<cr>", desc = "Explorer NeoTree (Root Dir)" },
		{ "<leader>ec", ":Neotree toggle dir=~/.config/nvim<cr>", desc = "Explorer NeoTree (Config)" },
	},
}
