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

require("lazy").setup({ { import = "config.plugins" }, { import = "config.plugins.lsp" },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {{ "nvim-lua/plenary.nvim" }, { "laher/neorg-exec" }, { "nvim-neorg/neorg-telescope" }},
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behavior
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.summary"] = {},
          ["core.export"] = {},
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp"
            }
          },
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
  },
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
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      { "rcarriga/nvim-notify", opts = { timeout = 1000 } },
    },
  },
  {
		"echasnovski/mini.animate",
		event = "VeryLazy",
		opts = function(_, opts)
			opts.scroll = {
				enable = false,
			}
		end,
	},
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
		opts = {
			plugins = {
				gitsigns = true,
				tmux = true,
        alacritty = { enabled = false, font = "+2" },
			},
		},
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
	{
    	"nvim-telescope/telescope-file-browser.nvim",
    	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
		"dinhhuy258/git.nvim",
		event = "BufReadPre",
		opts = {
			keymaps = {
				-- Open blame window
				blame = "<Leader>gb",
				-- Open file/folder in git repository
				browse = "<Leader>go",
			},
		},
	},
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{ "ThePrimeagen/vim-be-good" },
  { "folke/twilight.nvim" },
})
