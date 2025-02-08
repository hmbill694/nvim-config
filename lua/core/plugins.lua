local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }
	use({ 'nanotech/jellybeans.vim' })
	use({ 'Rigellute/shades-of-purple.vim' })
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use { 'kdheepak/lazygit.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }
	use({ 'tpope/vim-commentary' })
	use({ 'VonHeikemen/lsp-zero.nvim' })
	use({ 'neovim/nvim-lspconfig' })
	use({ 'hrsh7th/nvim-cmp' })
	use({ 'hrsh7th/cmp-nvim-lsp' })
	use { "williamboman/mason.nvim" }
	use { "nvim-lua/plenary.nvim" }
	use { 'folke/which-key.nvim',
		config = function()
			require('which-key').setup({
				delay = 3000,
			})
		end,
	}


	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
