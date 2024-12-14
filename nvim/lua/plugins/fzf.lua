return {
  "ibhagwan/fzf-lua",
  keys = {
    {
      "<leader>fs",
      function()
        require("fzf-lua").live_grep()
      end,
      desc = "live grep",
    },
  },
}
