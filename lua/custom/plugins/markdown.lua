-- [[ Markdown ]]

vim.lsp.config('markdown_oxide', {
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, 'Daily', function(args)
      local day = #args.args == 0 and 'today' or args.args
      client:exec_cmd({ title = 'jump', command = 'jump', arguments = { day } }, { bufnr = bufnr })
    end, { desc = 'Open daily note', nargs = '*' })
  end,
})

vim.pack.add { { src = 'https://github.com/OXY2DEV/markview.nvim', version = vim.version.range '*' } }
require('markview').setup {
  preview = {
    modes = { 'n', 'no', 'c' },
    hybrid_modes = { 'n' },
    callbacks = {
      on_enable = function(_, win)
        vim.wo[win].conceallevel = 2
        vim.wo[win].concealcursor = 'c'
      end,
    },
  },
  markdown = {
    list_items = { enable = false },
  },
}

-- Bullet lists: continue lists on <CR>/o, (de)indent with <Tab>/<S-Tab>, toggle checkboxes
local bullets_filetypes = { 'text', 'markdown', 'scratch', 'gitcommit' }
vim.g.bullets_set_mappings = 0
vim.g.bullets_enabled_file_types = bullets_filetypes
vim.pack.add { 'https://github.com/bullets-vim/bullets.vim' }

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('custom-bullets', { clear = true }),
  pattern = bullets_filetypes,
  callback = function(args)
    local function map(mode, lhs, rhs, desc) vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc and ('Bullets: ' .. desc) }) end
    map('i', '<CR>', '<Plug>(bullets-newline)')
    map('n', 'o', '<Plug>(bullets-newline)', 'New line')
    map('n', '<<', '<Plug>(bullets-promote)', 'Promote')
    map('v', '<', '<Plug>(bullets-promote)gv', 'Promote')
    map('i', '<S-Tab>', '<Plug>(bullets-promote)', 'Promote')
    map('n', '>>', '<Plug>(bullets-demote)', 'Demote')
    map('v', '>', '<Plug>(bullets-demote)gv', 'Demote')
    map('i', '<Tab>', '<Plug>(bullets-demote)', 'Demote')
    map('n', '<leader>b', '<Plug>(bullets-toggle-checkbox)', 'Toggle check[b]ox')
    map({ 'n', 'v' }, 'gN', '<Plug>(bullets-renumber)', 'Renumber list')
  end,
})
