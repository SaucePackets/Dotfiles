return {
	"nvim-lualine/lualine.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "solarized_dark",
				globalstatus = true,
				disabled_filetypes = { statusline = { "alpha" } },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{ "filename" },
                    -- stylua: ignore
                    {
                        function() return require("nvim-navic").get_location() end,
                        cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
                    },
				},
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " ", hint = " ", copilot = "" },
					},
					{ "encoding" },
					{ "filetype" },
					{ "diff" },
				},
				lualine_y = {
					{ "progress" },
					{ "location" },
				},
				lualine_z = {
					-- function()
					--   return " " .. os.date("%R")
					-- end,
				},
			},
			extensions = { "fugitive", "neo-tree", "lazy" },
		})
	end,
}
