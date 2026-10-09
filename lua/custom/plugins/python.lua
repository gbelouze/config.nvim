-- [[ Python ]]

-- Python is served by three language servers at once:
--   * ruff    -> linting diagnostics, code actions (fixes, organize imports)
--   * ty      -> navigation (definition, references, rename, code actions, completion, signature help)
--   * pyrefly -> type information (hover, type diagnostics, inlay hints)
-- ty and pyrefly both advertise the full capability set, so the overlap is pruned on init.
-- Whichever methods a client stops advertising get routed to the other one by vim.lsp.buf.* / telescope.
local function strip_capabilities(client, caps)
  for _, cap in ipairs(caps) do
    client.server_capabilities[cap] = false
  end
end

vim.lsp.config('ruff', {
  on_init = function(client) strip_capabilities(client, { 'hoverProvider' }) end,
})

vim.lsp.config('ty', {
  -- Silence ty's diagnostics so that pyrefly is the only source of type diagnostics.
  -- ty can push them, and also registers pull diagnostics at runtime (bypassing the capability pruning below).
  handlers = {
    ['textDocument/publishDiagnostics'] = function() end,
    ['client/registerCapability'] = function(err, params, ctx)
      params.registrations = vim.tbl_filter(function(reg) return reg.method ~= 'textDocument/diagnostic' end, params.registrations)
      return vim.lsp.handlers['client/registerCapability'](err, params, ctx)
    end,
  },
  on_init = function(client)
    strip_capabilities(client, {
      'hoverProvider',
      'inlayHintProvider',
      'documentHighlightProvider',
      'diagnosticProvider', -- pull-model diagnostics (textDocument/diagnostic)
    })
  end,
})

vim.lsp.config('pyrefly', {
  on_init = function(client)
    strip_capabilities(client, {
      'definitionProvider',
      'typeDefinitionProvider',
      'declarationProvider',
      'referencesProvider',
      'implementationProvider',
      'documentSymbolProvider',
      'workspaceSymbolProvider',
      'renameProvider',
      'completionProvider',
      'signatureHelpProvider',
      'documentHighlightProvider',
      'documentFormattingProvider',
      'documentRangeFormattingProvider',
      'codeLensProvider',
      'foldingRangeProvider',
      'callHierarchyProvider',
    })
  end,
})

-- [[ REPL ]]
-- Send code to a tmux pane. Cells are delimited by `# %%` (see after/ftplugin/python.lua)
vim.g.slime_target = 'tmux'
vim.g.slime_no_mappings = 1
vim.pack.add { 'https://github.com/jpalardy/vim-slime' }

vim.keymap.set('n', '<leader>Rc', '<Cmd>SlimeConfig<CR>', { desc = 'Slime: [c]onfig REPL' })
vim.keymap.set('n', '<leader>Rf', 'ggVG<Plug>SlimeRegionSend', { desc = 'Slime: Send whole [f]ile to REPL' })
vim.keymap.set('n', '<leader>Rp', '<Plug>SlimeParagraphSend', { desc = 'Slime: Send [p]aragraph to REPL' })
vim.keymap.set('n', '<leader>Rr', '<Cmd>SlimeSend0 "\\n"<CR>', { desc = 'Slime: Send \\n to REPL' })
vim.keymap.set('n', '<leader>Rs', '<Cmd>SlimeSendCurrentLine<CR>', { desc = 'Slime: [s]end current line to REPL' })
vim.keymap.set('x', '<leader>R', '<Plug>SlimeRegionSend', { desc = 'Slime: Send selection to REPL' })

-- [[ Docstrings ]]
vim.pack.add { 'https://github.com/danymat/neogen' }
require('neogen').setup {
  snippet_engine = 'luasnip',
  languages = {
    python = {
      template = { annotation_convention = 'numpydoc' },
    },
  },
}
vim.keymap.set('n', '<leader>cc', function() require('neogen').generate {} end, { desc = 'Neogen: generate documentation' })
