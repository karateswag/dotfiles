return {
  {
    "maxmx03/fluoromachine.nvim",
    config = function()
      require("fluoromachine").setup({
        glow = true,
        brightness = 0.1,
        theme = "retrowave",
        transparent = "full",
        colors = function()
          return {
            -- comments
            comment = "#a4a9ca",
          }
        end,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "fluoromachine",
    },
  },
}
