local set = vim.keymap.set

set('n', '<Leader>hw', '<CMD>HopWord<CR>', { desc = "Jump to any word." });
set('n', '<Leader>hl', '<CMD>HopLine<CR>', { desc = "Jump to any line." });
set('n', '<Leader>ha', '<CMD>HopAnywhere<CR>', { desc = "Jump to any location." });
