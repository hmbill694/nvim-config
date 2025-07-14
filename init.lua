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
require("auto-cmds.close-quickfix-menu-on-save")
require("auto-cmds.trim-trailing-whitespace-on-save")
-- require("auto-cmds.format-on-save")

-- Plugin Mappings
require("mappings.telescope")
require("mappings.markdown-preview")
require("mappings.harpoon")
require("mappings.git-blame")

-- Set Theme
vim.cmd.colorscheme "catppuccin-macchiato"

vim.opt.signcolumn = 'yes'
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.expandtab = true
vim.opt["tabstop"] = 2
vim.opt["shiftwidth"] = 2
vim.opt.scrolloff=20
