return {
    { 'mfussenegger/nvim-dap' },
    {
        'theHamsta/nvim-dap-virtual-text',
        opts = {}
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            'nvim-neotest/nvim-nio', -- optional, for file icons
        },
        opts = {}
    }
}
