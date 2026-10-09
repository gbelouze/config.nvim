-- [[ User commands ]]

vim.api.nvim_create_user_command('LspCapabilities', function(opts)
  local clients = vim.lsp.get_clients { name = opts.args }
  if #clients == 0 then
    vim.notify(string.format("No active LSP client found with name '%s'", opts.args), vim.log.levels.WARN)
    return
  end
  for _, client in ipairs(clients) do
    vim.notify(string.format('Capabilities for LSP [%s]:\n%s', client.name, vim.inspect(client.server_capabilities)), vim.log.levels.INFO)
  end
end, {
  nargs = 1,
  complete = function()
    return vim.tbl_map(function(client) return client.name end, vim.lsp.get_clients())
  end,
  desc = 'Show the capabilities of an attached LSP client by name',
})
