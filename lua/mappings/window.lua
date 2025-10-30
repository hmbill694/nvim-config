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


-- 2. Register the group with which-key
local wk = require("which-key")

wk.add({
  { "<leader>w", group = "Window" },
})
