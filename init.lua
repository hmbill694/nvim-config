-- Bootstrap the plugin manager
require("config.lazy")

-- Setup lazy.nvim
require("mount.mount-lazy-nvim")

-- Init base mappings
require("mappings.base")
require("mappings.lsp")
require("mappings.clipboard")
require("mappings.navigation")
require("mappings.spellcheck")

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
require("mappings.oil")

-- Set Theme
vim.cmd.colorscheme "tokyonight-storm"

vim.opt.signcolumn = 'yes'
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.expandtab = true
vim.opt["tabstop"] = 2
vim.opt["shiftwidth"] = 2
vim.opt.scrolloff=20

vim.opt["splitbelow"] = true
vim.opt["splitright"] = true

vim.opt.cmdheight = 0
