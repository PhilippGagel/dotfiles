return {
    -- { 'tpope/vim-fugitive' },
    -- { 'tpope/vim-rhubarb' },
    {
        'kdheepak/lazygit.nvim',
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },
    { 'lewis6991/gitsigns.nvim', opts = {} },
    {
        'f-person/git-blame.nvim',
        config = function()
            vim.g.gitblame_display_virtual_text = 0
            vim.g.gitblame_message_template = '<author> • <date>'
            vim.g.gitblame_date_format = '%x'
        end
    },
    { 'sindrets/diffview.nvim',  opts = {} }
}
