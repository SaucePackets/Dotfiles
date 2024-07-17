return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	keys = {
		vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {}),
		vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {}),
	},
	version = "*",
	dependencies = {
	"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
			mode = "tabs",
			separator_style = "slant",
			always_show_bufferline = false,
			show_buffer_close_icons = false,
			color_icons = true,
		},
	},
	offsets = {
		{
			filetype = "nvim-tree",
			text = "nvim-tree",
			highlight = "Directory",
			text_align = "left",
		},
	},
}
