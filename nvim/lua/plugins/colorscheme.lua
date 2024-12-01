return {
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   lazy = true,
  --   priority = 1000,
  -- },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
}
