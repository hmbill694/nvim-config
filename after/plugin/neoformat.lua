vim.g.neoformat_try_node_exe = 1

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.gleam", "*.yaml", "*.json", "*.go", "*.lua" },
	callback = function()
		vim.cmd("Neoformat")
	end,
})
