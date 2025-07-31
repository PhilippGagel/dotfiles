local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        if opts.desc then
            opts.desc = "keymaps.lua: " .. opts.desc
        end
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Insert mode
map('i', 'jj', '<Esc>', { desc = "Exit insert mode with by pressing jj." })
map('i', '<C-j>', '<esc>:m .+1<CR>==', { desc = "Move current line one line down." })
map('i', '<C-k>', '<esc>:m .-2<CR>==', { desc = "Move current line one line up." })
map('i', '<C-space>', function() vim.lsp.completion.get() end)
map('i', '<C-space>', function() vim.lsp.completion.get() end)

-- Normal mode
map('n', 'gl', '`.', { desc = "Jump to the last change in the file" })
map('n', '<leader>j', ':m .+1<CR>==', { desc = "Move current line one line down." })
map('n', '<leader>k', ':m .-2<CR>==', { desc = "Move current line one line up." })
map("n", "<leader>n", ":cn<CR>", { desc = "Jump to next entry in quickfix list." })
map("n", "<leader>N", ":cp<CR>", { desc = "Jump to previous entry in quickfix list." })
map("n", "Y", "y$", { desc = "Make Y behave like C and D do." })
map("n", "n", "nzzzv", { desc = "Center cursor centerd while moving through search." })
map("n", "N", "Nzzzv", { desc = "Center cursor centerd while moving through search." })
map("n", "J", "mzJ`z", { desc = "Center cursor centerd while concatinating lines." })
map("n", "<leader>+", ":vertical resize +5<CR>", { desc = "Increase current buffer width by 5." })
map("n", "<leader>-", ":vertical resize -5<CR>", { desc = "Decrease current buffer width by 5." })

-- Visual mode
map('v', 'J', ':m \'>+1<CR>gv=gv', { desc = "Move current line one line down." })
map('v', 'K', ':m \'<-2<CR>gv=gv', { desc = "Move current line one line up." })
