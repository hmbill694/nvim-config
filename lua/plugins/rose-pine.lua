return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      disable_background = true,       -- transparent Normal background
      disable_float_background = true, -- transparent floating windows (popups, LSP hover, etc.)
      styles = {
        transparency = true,           -- some versions use this flag instead/as well
      },
    })
    vim.cmd("colorscheme rose-pine")
  end,
}
