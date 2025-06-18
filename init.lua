-- Bootstrap the plugin manager
require("config.lazy")

-- Setup lazy.nvim
require("mount.mount-lazy-nvim")

-- Init base mappings
require("mappings.base")
require("mappings.window")
require("mappings.lsp")
require("mappings.clipboard")
require("mappings.navigation")

-- Register AutoCmds
-- Attach our LSP Actions
require("auto-cmds.lsp-attach")
require("auto-cmds.format-on-save")

-- Plugin Mappings
require("mappings.telescope")
require("mappings.markdown-preview")

-- Set Theme
vim.cmd.colorscheme "catppuccin-macchiato"

vim.opt.signcolumn = 'yes'
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.expandtab = true
vim.opt["tabstop"] = 2
vim.opt["shiftwidth"] = 2
