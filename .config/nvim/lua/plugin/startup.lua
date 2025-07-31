return {
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        opts = {
            config = {
                week_header = { enable = true },
                packages = { enable = true }, -- show how many plugins neovim loaded
                -- limit how many projects list, action when you press key or enter it will run this action.
                -- action can be a function type, e.g.
                -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
            }
        },
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    }
}
