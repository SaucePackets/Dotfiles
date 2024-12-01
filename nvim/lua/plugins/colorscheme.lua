return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
}
