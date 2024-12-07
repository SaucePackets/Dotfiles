return {
	-- {
	-- 	"craftzdog/solarized-osaka.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("solarized-osaka").setup({
	-- 			transparent = true,
	-- 		})
	-- 		vim.cmd.colorscheme("solarized-osaka")
	-- 	end,
	-- },
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		-- require("rose-pine").setup({
	-- 		--   styles = {
	-- 		--     transparency = true,
	-- 		--   }
	-- 		-- })
	-- 		vim.cmd([[colorscheme rose-pine]])
	-- 	end,
	-- },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
}
