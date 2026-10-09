-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })
vim.keymap.set('n', '<leader>tt', '<Cmd>Neotree<CR>', { desc = 'Open Neo-tree' })
vim.keymap.set('n', '<leader>tw', '<Cmd>Neotree close<CR>', { desc = 'Close Neo-tree' })
vim.keymap.set('n', '<leader>tb', '<Cmd>Neotree focus buffers<CR>', { desc = 'Open Neo-tree [b]uffers' })
vim.keymap.set(
  'n',
  '<leader>tc',
  function() vim.cmd.Neotree { 'reveal_force_cwd', vim.fs.joinpath(vim.fn.stdpath 'config', 'init.lua') } end,
  { desc = 'Open Neovim [c]onfiguration directory' }
)
vim.keymap.set('n', '<leader>tg', '<Cmd>Neotree float git_status<CR>', { desc = 'Open a [g]it status window' })

require('neo-tree').setup {
  close_if_last_window = true,
  default_component_configs = {
    indent = {
      padding = 0,
    },
    icon = {
      folder_closed = '',
      folder_open = '',
      folder_empty = '',
    },
    git_status = {
      symbols = {
        unstaged = '✗',
        staged = '✓',
        unmerged = '',
        renamed = '➜',
        untracked = '',
        deleted = '',
        ignored = '◌',
      },
    },
  },
  filesystem = {
    follow_current_file = { enabled = true },
    hijack_netrw_behavior = 'open_default',
    use_libuv_file_watcher = true,
    filtered_items = {
      visible = false,
      hide_dotfiles = true,
      hide_gitignored = true,
      always_show = { '.gitignore' },
      never_show = { '.DS_Store', 'Icon\r' },
    },
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
  event_handlers = {
    {
      event = 'neo_tree_buffer_enter',
      handler = function() vim.opt_local.signcolumn = 'auto' end,
    },
  },
}
