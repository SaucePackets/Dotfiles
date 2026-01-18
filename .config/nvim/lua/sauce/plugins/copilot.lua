return {
	{
		{
			"CopilotC-Nvim/CopilotChat.nvim",
			dependencies = {
				{ "nvim-lua/plenary.nvim", branch = "master" },
			},
			build = "make tiktoken",
			cmd = "CopilotChat",
			opts = function()
				local user = vim.env.USER or "User"
				user = user:sub(1, 1):upper() .. user:sub(2)
				return {
					auto_insert_mode = true,
					headers = {
						user = "  " .. user .. " ",
						assistant = "  Copilot ",
						tool = "󰊳  Tool ",
					},
					window = {
						width = 0.4,
					},
				}
			end,
			keys = {
				{ "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
				{ "<leader>a", "", desc = "+ai", mode = { "n", "x" } },
				{
					"<leader>aa",
					function()
						return require("CopilotChat").toggle()
					end,
					desc = "Toggle (CopilotChat)",
					mode = { "n", "x" },
				},
				{
					"<leader>ax",
					function()
						return require("CopilotChat").reset()
					end,
					desc = "Clear (CopilotChat)",
					mode = { "n", "x" },
				},
				{
					"<leader>aq",
					function()
						vim.ui.input({
							prompt = "Quick Chat: ",
						}, function(input)
							if input ~= "" then
								require("CopilotChat").ask(input)
							end
						end)
					end,
					desc = "Quick Chat (CopilotChat)",
					mode = { "n", "x" },
				},
				{
					"<leader>ap",
					function()
						require("CopilotChat").select_prompt()
					end,
					desc = "Prompt Actions (CopilotChat)",
					mode = { "n", "x" },
				},
			},
		},
		{
			"zbirenbaum/copilot.lua",
			dependencies = {
				"copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
			},
		},
	},
}
