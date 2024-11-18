return {
  "akinsho/bufferline.nvim",
  keys = {
    { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
    { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev Buffer" },
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
