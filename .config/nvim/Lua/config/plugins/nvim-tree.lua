-- Nvimtree (File Explorer)

-- Currently not using but saving just in case I decide to use it again
if true then return {} end

return {
  	"nvim-tree/nvim-tree.lua",
  	dependencies = { "nvim-tree/nvim-web-devicons" },
  	config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- change color for arrows in tree to light blue
    vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

    -- configure nvim-tree
    nvimtree.setup({
      view = {
        width = 35,
      },
	renderer = {
    	root_folder_modifier = ":t",
	 -- These icons are visible when you install web-devicons
    	icons = {
      		glyphs = {
        		default = "",
        		symlink = "",
        		folder = {
          			arrow_open = "",
          			arrow_closed = "",
          			default = "",
          			open = "",
          			empty = "",
          			empty_open = "",
          			symlink = "",
          			symlink_open = "",
        		},
        		git = {
          			unstaged = "",
          			staged = "S",
          			unmerged = "",
          			renamed = "➜",
          			untracked = "U",
          			deleted = "",
          			ignored = "◌",
        		},
      		},
    	},
  	},

      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

     -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer

  end,
}


