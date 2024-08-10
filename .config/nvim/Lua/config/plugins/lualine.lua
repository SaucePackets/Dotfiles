return {
	"nvim-lualine/lualine.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enbaled = true,
				theme = "rose-pine",
				globalstatus = true,
				disabled_filetypes = { statusline = { "alpha" } },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "filename" },
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " ", hint = " ", copilot = " " },
					},
					{ "encoding" },
					{ "filetype" },
					{ "diff" },
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			extensions = { "fugitive", "lazy" },
		})
	end,
}
