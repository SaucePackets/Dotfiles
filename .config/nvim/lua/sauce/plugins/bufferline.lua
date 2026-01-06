return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	keys = {
		{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next Tab" },
		{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev Tab" },
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
			filetype = "neo-tree",
			text = "File Explorer",
			highlight = "Directory",
			text_align = "left",
		},
	},
}
