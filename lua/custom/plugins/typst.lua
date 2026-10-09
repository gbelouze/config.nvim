-- [[ Typst ]]

vim.lsp.config('tinymist', {
  settings = {
    exportPdf = 'onSave',
    formatterMode = 'typstyle',
  },
  on_attach = function(client, bufnr)
    local function pin(path) client:exec_cmd({ title = 'pin', command = 'tinymist.pinMain', arguments = { path } }, { bufnr = bufnr }) end

    vim.keymap.set('n', '<leader>tp', function() pin(vim.api.nvim_buf_get_name(0)) end, { buffer = bufnr, desc = '[T]inymist [P]in main file' })
    vim.keymap.set('n', '<leader>tu', function() pin(vim.NIL) end, { buffer = bufnr, desc = '[T]inymist [U]npin main file' })

    local bufname = vim.api.nvim_buf_get_name(bufnr)
    if vim.fs.basename(bufname) == 'main.typ' then pin(bufname) end
  end,
})

-- typst-preview downloads its own binaries (websocat, ...) on install/update
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name ~= 'typst-preview.nvim' then return end
    if ev.data.kind ~= 'install' and ev.data.kind ~= 'update' then return end
    if not ev.data.active then vim.cmd.packadd 'typst-preview.nvim' end
    require('typst-preview').update()
  end,
})

vim.pack.add { { src = 'https://github.com/chomosuke/typst-preview.nvim', version = vim.version.range '1.*' } }
require('typst-preview').setup {
  dependencies_bin = { tinymist = 'tinymist' },
}
