return {
  "windwp/nvim-ts-autotag",
  lazy =false,
  config = {},
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
}
