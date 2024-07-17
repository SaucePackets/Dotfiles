return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local fb_actions = require("telescope").extensions.file_browser.actions

			local function telescope_buffer_dir()
				return vim.fn.expand("%:p:h")
			end

			require("telescope").setup({
				defaults = {
					wrap_results = true,
					layout_strategy = "horizontal",
					layout_config = { prompt_position = "top" },
					sorting_strategy = "ascending",
					winblend = 0,
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
					},
				},
				pickers = {
					diagnostics = {
						theme = "ivy",
						initial_mode = "normal",
						layout_config = {
							preview_cutoff = 9999,
						},
					},
				},
				extensions = {
					file_browser = {
						theme = "dropdown",
						hijack_netrw = true,
						mappings = {
							["n"] = {
								["N"] = fb_actions.create,
								["h"] = fb_actions.goto_parent_dir,
								["/"] = function()
									vim.cmd("startinsert")
								end,
								["<C-u>"] = function(prompt_bufnr)
									for i = 1, 10 do
										actions.move_selection_previous(prompt_bufnr)
									end
								end,
								["<C-d>"] = function(prompt_bufnr)
									for i = 1, 10 do
										actions.move_selection_next(prompt_bufnr)
									end
								end,
								["<PageUp>"] = actions.preview_scrolling_up,
								["<PageDown>"] = actions.preview_scrolling_down,
							},
						},
					},
				},
			})
			-- keymaps
			local keymap = vim.keymap -- for conciseness

			require("telescope").load_extension("file_browser")
			telescope.load_extension("fzf")

			keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
			keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
			keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
			keymap.set("n", "<leader>hv", ":Telescope harpoon marks<CR>", { desc = "Harpoon [M]arks" })

			vim.keymap.set("n", "<leader>sf", function()
				telescope.extensions.file_browser.file_browser({
					path = "%:p:h",
					cwd = telescope_buffer_dir(),
					respect_gitignore = false,
					hidden = true,
					grouped = true,
					previewer = false,
					initial_mode = "normal",
					layout_config = { height = 40 },
				})
			end)
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
}
