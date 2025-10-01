return {
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = 'nvim-tree/nvim-web-devicons',
    config= function()
        vim.opt.termguicolors = true
        require("bufferline").setup{
            options = {
                mode = "buffer",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "Explorer",
                        text_align = "center",
                        separator = false,
                    },
                },
                indicator = {
                    -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
                    style = 'none', -- 'icon' | 'underline' | 'none',
                },
                separator_style = "slant", -- "slant" | "slope" | "thick" | "thin"
                show_close_icon = false,
            },
        }
    end,
}
