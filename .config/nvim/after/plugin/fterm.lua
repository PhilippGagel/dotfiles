vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

vim.api.nvim_create_user_command('CargoBuild', function()
    require('FTerm').scratch({ cmd = { 'cargo', 'build' } })
end, { bang = true })
