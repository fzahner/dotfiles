return {
    'catppuccin/nvim',
    lazy = true,
    config=function() 
        require('catppuccin').setup({
            flavour = "auto", -- latte, frappe, macchiato, mocha
        })
    end,
    
}
