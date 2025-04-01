vim.g.mapleader = " "                -- easy to reach leader key
vim.keymap.set("n", "-", vim.cmd.Ex) -- need nvim 0.8+

-- Fuzzy finder
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


-- LSP Actions

vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', { desc = 'Hover LSP Action' })
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { desc = 'Goto Definition' })
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { desc = 'Goto Declaration' })
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', { desc = 'Goto Implementation' })
vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', { desc = 'Goto Type Definition' })
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', { desc = 'Goto References' })
vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', { desc = 'Get Signarture Information' })
vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = 'Rename' })
vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', { desc = 'Format' })
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = 'Code Actions' })
