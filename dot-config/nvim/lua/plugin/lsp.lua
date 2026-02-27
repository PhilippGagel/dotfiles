return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            automatic_enable = true,
            ensure_installed = { 'rust_analyzer', 'clangd', 'lua_ls', 'jsonls' }
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    }
}
