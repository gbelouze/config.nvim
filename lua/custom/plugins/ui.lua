-- [[ UI ]]

-- Cmdline, messages and notifications in floating windows
vim.pack.add {
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/rcarriga/nvim-notify',
  'https://github.com/folke/noice.nvim',
}
require('noice').setup {
  lsp = {
    -- Render markdown with treesitter in hover and signature help
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
    },
  },
  routes = {
    -- Hide the "written" message after :w
    { filter = { event = 'msg_show', kind = '', find = 'written' }, opts = { skip = true } },
  },
  messages = {
    view = 'notify',
    view_error = 'notify',
    view_warn = 'notify',
    view_history = 'messages',
    view_search = 'cmdline',
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    lsp_doc_border = true,
  },
}
vim.keymap.set('n', '<leader>su', function() require('notify').dismiss() end, { desc = 'Notifications: [s]hut [u]p' })
