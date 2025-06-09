vim.g.mapleader = " "                -- easy to reach leader key
vim.keymap.set("n", "-", vim.cmd.Ex) -- need nvim 0.8+

-- Fuzzy finder
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


-- LSP Actions

vim.keymap.set('n', '<leader>gk', '<cmd>lua vim.lsp.buf.hover()<cr>', { desc = 'Hover LSP Action' })
vim.keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { desc = 'Goto Definition' })
vim.keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { desc = 'Goto Declaration' })
vim.keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', { desc = 'Goto Implementation' })
vim.keymap.set('n', '<leader>go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', { desc = 'Goto Type Definition' })
vim.keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>', { desc = 'Goto References' })
vim.keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', { desc = 'Get Signarture Information' })
vim.keymap.set('n', '<leader>gn', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = 'Rename' })
vim.keymap.set('n', '<leader>gx', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', { desc = 'Format' })
vim.keymap.set('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = 'Code Actions' })
vim.keymap.set('n', '<leader>ge', "<cmd> lua vim.diagnostic.open_float()<CR>", { desc = 'Show error in popup.' })

-- Remap CTRL+W for window stuff

vim.keymap.set('n', '<leader>w', '<C-w>', { desc = 'Window stuff' })

-- Helper to map <leader>w{key} to <C-w>{key} with descriptions
local mappings = {
  h = { '<C-w>h', 'Window left' },
  j = { '<C-w>j', 'Window down' },
  k = { '<C-w>k', 'Window up' },
  l = { '<C-w>l', 'Window right' },
  s = { '<C-w>s', 'Split below (horizontal)' },
  v = { '<C-w>v', 'Split right (vertical)' },
  c = { '<C-w>c', 'Close window' },
  o = { '<C-w>o', 'Close other windows' },
  q = { '<C-w>q', 'Quit window' },
  ['='] = { '<C-w>=', 'Equalize window sizes' },
  T = { '<C-w>T', 'Move to new tab' },
  x = { '<C-w>x', 'Swap windows' },
  r = { '<C-w>r', 'Rotate down/right' },
  R = { '<C-w>R', 'Rotate up/left' },
  w = { '<C-w>w', 'Next window' },
  W = { '<C-w>W', 'Previous window (reverse)' },
  b = { '<C-w>b', 'Bottom window' },
  p = { '<C-w>p', 'Previous window' },
}

for key, mapping in pairs(mappings) do
  vim.keymap.set('n', '<leader>w' .. key, mapping[1], { noremap = true, silent = true, desc = mapping[2] })
end
