return {
    'nvim-lualine/lualine.nvim',
    opts = {
        sections = {
            lualine_c = {
                {
                    'filename',
                    path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path, 3 = relative to home
                }
            }
        }
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' }
}
