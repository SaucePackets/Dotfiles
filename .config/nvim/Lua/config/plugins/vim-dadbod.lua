return {

	{ "tpope/vim-dadbod", cmd = "DB" },
	{
		"kristijanhusak/vim-dadbod-completion",
		dependencies = "vim-dadbod",
		ft = sql_ft,
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = sql_ft,
				callback = function()
					local cmp = require("cmp")

					-- global sources
					---@param source cmp.SourceConfig
					local sources = vim.tbl_map(function(source)
						return { name = source.name }
					end, cmp.get_config().sources)

					-- add vim-dadbod-completion source
					table.insert(sources, { name = "vim-dadbod-completion" })

					-- update sources for the current buffer
					cmp.setup.buffer({ sources = sources })
				end,
			})
		end,
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
}
