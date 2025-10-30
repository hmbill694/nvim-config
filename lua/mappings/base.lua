-- Disabling this for now in favor of using oil
-- vim.keymap.set("n", "-", vim.cmd.Ex)
--
--
--
vim.keymap.set('n', '<leader>sj', '<C-W><C-J>', { desc = 'Move to split below' })
vim.keymap.set('n', '<leader>sk', '<C-W><C-K>', { desc = 'Move to split above' })
vim.keymap.set('n', '<leader>sl', '<C-W><C-L>', { desc = 'Move to split right' })
vim.keymap.set('n', '<leader>sh', '<C-W><C-H>', { desc = 'Move to split left' })

vim.keymap.set('n', '<leader>s-', ':split<CR>', { desc = 'Create horizontal split' })
vim.keymap.set('n', '<leader>s|', ':vsplit<CR>', { desc = 'Create vertical split' })

-- Max out the height of the current split
vim.keymap.set('n', '<leader>sf|', '<C-w>_', { desc = 'Maximize split height' })

-- Max out the width of the current split
vim.keymap.set('n', '<leader>sf_', '<C-w>|', { desc = 'Maximize split width' })

-- Normalize all split sizes
vim.keymap.set('n', '<leader>sf=', '<C-w>=', { desc = 'Normalize all split sizes' })

-- 2. Register the group with which-key
local wk = require("which-key")

wk.add({
  { "<leader>s", group = "Splits" },
  { "<leader>sf", group = "Split formatting" },
})
