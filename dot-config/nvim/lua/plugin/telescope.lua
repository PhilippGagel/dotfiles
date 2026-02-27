return {
    {
        'nvim-telescope/telescope.nvim',
        tag = "0.1.8",
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {},
        config = function()
            local telescope = require('telescope')
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<Leader>p', builtin.find_files, { desc = "Telescope find files" })
            vim.keymap.set('n', '<Leader>f', builtin.live_grep, { desc = "Telescope live grep" })
            vim.keymap.set('n', '<Leader>b', builtin.buffers, { desc = "Telescope open buffers" })

            -- extensions
            telescope.load_extension('dap')
        end
    },
    {
        'nvim-telescope/telescope-dap.nvim'
    }
}
