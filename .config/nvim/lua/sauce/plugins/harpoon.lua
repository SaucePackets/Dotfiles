return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({})

		local keymap = vim.keymap

		-- Your original keymaps (adapted for harpoon2 API)
		keymap.set("n", "<leader>hm", function() harpoon:list():add() end, { desc = "Mark file with harpoon" })
		keymap.set("n", "<leader>hr", function() harpoon:list():remove() end, { desc = "Remove file from harpoon" })
		keymap.set("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Go to next harpoon mark" })
		keymap.set("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "Go to previous harpoon mark" })

		-- Toggle harpoon menu
		keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon Menu" })

		-- Quick navigation to harpooned files (1-5)
		keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon File 1" })
		keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon File 2" })
		keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon File 3" })
		keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon File 4" })
		keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Harpoon File 5" })
	end,
}
