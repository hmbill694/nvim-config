-- Download plugins, set theme and configure lazy.nvim
-- Import our plugins
local treesitter = require("plugins.treesitter")
local lazygit = require("plugins.lazygit")
local telescope = require("plugins.telescope")
local vim_commentary = require("plugins.vim-commentary")
local mason = require("plugins.mason")
local mason_lspconfig = require("plugins.mason-lspconfig")
local which_key = require("plugins.which-key")
local markdown_preview = require("plugins.markdown-preview")
local catppuccin = require("plugins.catppuccin")
local blink = require("plugins.blink-cmp")
local nvim_lspconfig = require("plugins.nvim-lspconfig")

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		treesitter,
		lazygit,
		telescope,
		vim_commentary,
		mason,
		mason_lspconfig,
		which_key,
		catppuccin,
		blink,
		nvim_lspconfig,
		markdown_preview,

	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "catppuccin-macchiato" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
