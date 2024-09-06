return {
	{
		"echasnovski/mini.surround",
		version = "*",
		config = function()
			require("mini.surround").setup()
		end,
	},
	-- {
	-- 	"echasnovski/mini.files",
	-- 	version = "*",
	-- 	config = function()
	-- 		require("mini.files").setup()
	-- 		vim.keymap.set("n", "<leader>sf", "<cmd>:lua MiniFiles.open()<cr>", { desc = "Open mini files explorer" })
	-- 	end,
	-- },
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		opts = function(_, opts)
			opts.scroll = {
				enable = false,
			}
		end,
	},
}
