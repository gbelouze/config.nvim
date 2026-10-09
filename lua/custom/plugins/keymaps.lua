-- [[ Personal keymaps ]]
-- Core keymaps (quit, save, <C-c>) are in init.lua

vim.keymap.set('n', '<BS>', ':')
vim.keymap.set('n', 'Q', '<Nop>')

-- Move by screen lines when wrapping
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

vim.keymap.set('n', 'vv', 'v_o$', { desc = 'Select line content' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join next line, keeping cursor position' })

-- Keep the cursor centered when scrolling and searching
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search hit' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search hit' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move lines down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move lines up' })
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right' })

vim.keymap.set('n', '<leader>rw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[R]eplace current [w]ord in buffer' })
vim.keymap.set('n', '<leader>rW', [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[R]eplace current [W]ord in line' })
