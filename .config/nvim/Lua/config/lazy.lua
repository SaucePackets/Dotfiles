local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Possible adds: neotest, dap
--
require("lazy").setup({
	{ import = "config.plugins" },
	{ import = "config.plugins.lsp" },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			require("noice").setup({
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				routes = {
					{
						filter = { event = "notify", find = "No information available" },
						opts = { skip = true },
					},
				},
				presets = {
					lsp_doc_border = true,
					bottom_search = true,
					command_palette = true,
					long_message_to_split = true,
					inc_rename = true,
				},
			})
			require("lualine").setup({
				sections = {
					lualine_x = {
						{
							require("noice").api.statusline.mode.get,
							cond = require("noice").api.statusline.mode.has,
							color = { fg = "#ff9e64" },
						},
					},
				},
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			{ "rcarriga/nvim-notify", opts = { timeout = 1000 } },
		},
	},
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		window = {
			options = {
				signcolumn = "no",
				number = false,
			},
		},
		plugins = {
			options = {
				enabled = true,
				ruler = false,
				laststatus = 0,
			},
			twilight = { enabled = true },
			gitsigns = { enabled = false },
			tmux = { enabled = true },
			alacritty = { enabled = true, font = "14" },
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("noice").setup({
				presets = { inc_rename = true },
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "TodoTrouble", "TodoTelescope" },
		config = true,
		keys = {
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next todo comment",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous todo comment",
			},
			{ "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
			{ "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
			{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
			{ "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
		},
	},
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	{ "b0o/SchemaStore.nvim", lazy = true },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{ "craigmac/nvim-supertab" },
	{ "Hoffs/omnisharp-extended-lsp.nvim", lazy = true },
	{ "preservim/vim-pencil" },
  { "tpope/vim-dotenv" },
})
