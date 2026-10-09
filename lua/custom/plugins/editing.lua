-- [[ Editing & navigation ]]

-- Jump anywhere on screen with `s` + 2 characters
vim.pack.add { 'https://codeberg.org/andyg/leap.nvim' }
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)', { desc = 'Leap' })
vim.keymap.set('n', 'S', '<Plug>(leap-from-window)', { desc = 'Leap to other windows' })

-- `w`, `e`, `b` move by subword (camelCase, snake_case) and skip punctuation-only words
vim.pack.add { 'https://github.com/chrisgrieser/nvim-spider' }
for _, motion in ipairs { 'w', 'e', 'b' } do
  vim.keymap.set({ 'n', 'o', 'x' }, motion, function() require('spider').motion(motion) end, { desc = 'Spider-' .. motion })
end

-- Edit the file system like a buffer with `:Oil`
vim.pack.add { 'https://github.com/stevearc/oil.nvim' }
require('oil').setup {}

vim.pack.add { 'https://github.com/folke/zen-mode.nvim' }

-- Built-in undo tree viewer
vim.cmd.packadd 'nvim.undotree'
vim.keymap.set('n', '<leader>U', vim.cmd.Undotree, { desc = 'Toggle [U]ndotree' })

-- [[ Trouble ]]
vim.pack.add { 'https://github.com/folke/trouble.nvim' }
local trouble = require 'trouble'
trouble.setup {}
vim.keymap.set('n', '<leader>j', function() trouble.next { skip_groups = true, jump = true } end, { desc = 'Trouble: jump next' })
vim.keymap.set('n', '<leader>k', function() trouble.prev { skip_groups = true, jump = true } end, { desc = 'Trouble: jump previous' })
vim.keymap.set('n', '<leader>xc', trouble.close, { desc = 'Trouble: [c]lose' })
vim.keymap.set('n', '<leader>xd', function() trouble.toggle 'diagnostics' end, { desc = 'Trouble: toggle [d]iagnostics' })
vim.keymap.set('n', '<leader>xq', function() trouble.toggle 'quickfix' end, { desc = 'Trouble: toggle [q]uickfix' })
vim.keymap.set('n', '<leader>xl', function() trouble.toggle 'loclist' end, { desc = 'Trouble: toggle [l]oclist' })
vim.keymap.set('n', 'gR', function() trouble.toggle 'lsp_references' end, { desc = 'Trouble: LSP [R]eferences' })

-- [[ Refactoring ]]
-- Refactorings are operators: in normal mode, follow the keymap with a motion or textobject
-- (e.g. `<leader>reaF` extracts around a function), or use them on a visual selection.
vim.pack.add {
  'https://github.com/lewis6991/async.nvim',
  'https://github.com/ThePrimeagen/refactoring.nvim',
}

local function refactor(name)
  return function() return require('refactoring')[name]() end
end
vim.keymap.set({ 'n', 'x' }, '<leader>re', refactor 'extract_func', { expr = true, desc = 'Refactor: [e]xtract function' })
vim.keymap.set({ 'n', 'x' }, '<leader>rf', refactor 'extract_func_to_file', { expr = true, desc = 'Refactor: extract function to [f]ile' })
vim.keymap.set({ 'n', 'x' }, '<leader>rv', refactor 'extract_var', { expr = true, desc = 'Refactor: extract [v]ariable' })
vim.keymap.set({ 'n', 'x' }, '<leader>ri', refactor 'inline_var', { expr = true, desc = 'Refactor: [i]nline variable' })
vim.keymap.set({ 'n', 'x' }, '<leader>rI', refactor 'inline_func', { expr = true, desc = 'Refactor: [I]nline function' })
vim.keymap.set({ 'n', 'x' }, '<leader>rr', function() require('refactoring').select_refactor() end, { desc = 'Refactor: select refactoring' })

-- Kitty config syntax
vim.pack.add { 'https://github.com/fladson/vim-kitty' }
