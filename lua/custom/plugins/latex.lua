-- [[ LaTeX ]]
-- vimtex: compilation, viewing, motions and textobjects. Mappings are under <localleader>l (e.g. 'll to compile).

vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_view_general_viewer = 'skim'
vim.g.vimtex_view_forward_search_on_start = false
vim.g.vimtex_fold_enabled = true
vim.g.vimtex_toc_config = {
  mode = 1,
  fold_enable = 0,
  hide_line_numbers = 1,
  resize = 0,
  refresh_always = 1,
  show_help = 0,
  show_numbers = 1,
  split_pos = 'leftabove',
  split_width = 30,
  tocdeth = 3,
  indent_levels = 1,
  todo_sorted = 1,
}
vim.g.vimtex_compiler_latexmk = {
  out_dir = '.build/',
}
vim.g.vimtex_quickfix_open_on_warning = false

vim.pack.add { 'https://github.com/lervag/vimtex' }

-- Bring the terminal back to the front after an inverse search from Skim
local function focus_terminal() vim.cmd [[silent execute "!open -a kitty"]] end

-- latexmk builds into .build/; copy the resulting main.pdf next to the sources
local function move_pdf()
  local project_root = vim.b.vimtex.root
  local pdf = project_root .. '/.build/main.pdf'
  local new_pdf = project_root .. '/main.pdf'
  for _ = 1, 2 do
    if vim.fn.filereadable(pdf) == 0 then
      project_root = project_root .. '/..'
      pdf = project_root .. '/.build/main.pdf'
      new_pdf = project_root .. '/main.pdf'
    end
  end
  if vim.fn.filereadable(pdf) > 0 then
    vim.fn.writefile(vim.fn.readfile(pdf, 'b'), new_pdf, 'b')
    vim.cmd(string.format([[call vimtex#log#info('Moved %s out of .build')]], pdf))
  end
end

local vimtex_augroup = vim.api.nvim_create_augroup('custom-vimtex', { clear = true })
vim.api.nvim_create_autocmd('User', {
  pattern = 'VimtexEventViewReverse',
  group = vimtex_augroup,
  callback = function() vim.schedule(focus_terminal) end,
})
vim.api.nvim_create_autocmd('User', {
  pattern = 'VimtexEventCompileSuccess',
  group = vimtex_augroup,
  callback = function() vim.schedule(move_pdf) end,
})
