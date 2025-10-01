return {
    "williamboman/mason.nvim",
    config = function()
    require("mason").setup({
    -- Config at https://github.com/williamboman/mason.nvim?tab=readme-ov-file#configuration
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })
    end,
}
