return {
    {
        "rebelot/kanagawa.nvim",
        config = function()
            require 'kanagawa'.setup { theme = "wave" }

            vim.cmd([[
                set background=dark
                colorscheme kanagawa
            ]])
        end
    }
}
