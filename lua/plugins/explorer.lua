-- Keep the default Snacks file explorer (same tree, same icons, same
-- <leader>e), but float it as a centered Telescope-style popup instead of
-- docking it as a permanent left sidebar, and close it on selecting a file
-- (the explorer defaults to staying open, since it's normally a sidebar).
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            layout = { preset = "telescope", preview = false },
            jump = { close = true },
          },
        },
      },
    },
  },
}
