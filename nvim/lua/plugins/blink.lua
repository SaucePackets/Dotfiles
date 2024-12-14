return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<C-j>"] = {
        "select_next",
        "show",
      },
      ["<C-k>"] = {
        "select_prev",
        "show",
      },
    },
    completion = {
      ghost_text = {
        enabled = false,
      },
    },
  },
}
