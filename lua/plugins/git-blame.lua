return {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
        enabled = false, -- Start with the plugin turned off and only turn it on when we toggle
        message_template = " <summary> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
        date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
        virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
    },
}
