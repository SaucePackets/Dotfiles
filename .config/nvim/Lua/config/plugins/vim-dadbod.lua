return {
	{
		"tpope/vim-dadbod",
    lazy = true,
		cmd = "DB",
	},
	{
		"kristijanhusak/vim-dadbod-ui",
    lazy = true,
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
			-- Add database here--
			vim.g.db_ui_use_nerd_fonts = 1
		end,
		keys = {
			{ "<leader>d", "<cmd>DBUIToggle<cr>", desc = "Toggle DBUI" },
		},
	},
}
