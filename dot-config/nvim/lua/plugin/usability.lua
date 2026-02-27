return {
    {
        'smoka7/hop.nvim',
        version = "*",
        opts = {
            keys = 'etovxqpdygfblzhckisuran'
        }
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    {
        'jake-stewart/multicursor.nvim',
        branch = '1.0',
        opts = {}

    },
    {
        'kevinhwang91/nvim-bqf',
        opts = {}
    },
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<Leader>u', function() vim.cmd([[UndotreeToggle]]) end)
        end
    },
    { 'tpope/vim-surround' },
    {
        'numToStr/FTerm.nvim',
        opts = {
            border = 'bold',
        }
    },
    { 'rcarriga/nvim-notify', opts = {}, config = function() vim.notify = require('notify') end },
    { 'tpope/vim-commentary' },
    { 'folke/trouble.nvim',   opts = {} },
    {
        'stevearc/oil.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            opts = {}
        },
        lazy = false,
        config = function()
            require('oil').setup()
        end,
        keys = {
            { '<Leader>e', ":Oil<CR>", desc = "Open Oil filebrowser", silent = true }
        },
    },
    {
        "benomahony/oil-git.nvim",
        dependencies = { "stevearc/oil.nvim" }
    },
    {
        "JezerM/oil-lsp-diagnostics.nvim",
        dependencies = { "stevearc/oil.nvim" },
        opts = {}
    },
    {
        'folke/todo-comments.nvim',
        dependencies = "nvim-lua/plenary.nvim",
        opts = {}
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "bngarren/checkmate.nvim",
        ft = "markdown",
        opts = {},
    },
    -- {
    --     'ahmedkhalf/project.nvim',
    -- },
    { 'kevinhwang91/nvim-ufo',          dependencies = 'kevinhwang91/promise-async' },
    { 'HiPhish/rainbow-delimiters.nvim' },
    {
        "OXY2DEV/markview.nvim",
        lazy = false,

        -- For `nvim-treesitter` users.
        priority = 49,
        opts = {
        }
    },

    -- cpp specific
    { 'cdelledonne/vim-cmake' },
    -- csv specific
    { 'chrisbra/csv.vim' },
    -- rust specific
    { 'Saecki/crates.nvim' },
    {
        'Funk66/jira.nvim',
        opts = {
            domain = 'safelog.atlassian.net',
            user = 'gagel@safelog.de',
            token = '<INSERT_YOUR_TOKEN_HERE>',
            key = { 'RP', 'HOME', 'HACO', 'MACS', 'HWA', 'AXIS', 'LOC', 'DC' }
        }
    },
    {
        '0xferrous/ansi.nvim',
        opts = {
            auto_enable = true,
            filetypes = { 'log', 'ansi', 'diff' }
        }
    }
}
