return {
	-- {
	-- 	dir = "~/Projects/Neovim/quick-note.nvim",
	-- 	name = "quick-note",
	-- 	dev = true,
	-- 	opts = {
	-- 		-- keymaps = {
	-- 		-- 	open_floating_window = "<leader>nn", -- Open with <leader>nn
	-- 		-- 	close_buffer = "x", -- Close with 'x'
	-- 		-- 	close_floating_window = "<leader>nc", -- Close floating window with <leader>nc
	-- 		-- },
	-- 	},
	-- },
	{
		"jdkingsbury/quick-note.nvim",
		config = function()
			require("quick-note").setup({
				file_path = "~/.config/nvim/scratch.txt",
			})
		end,
	},
}
