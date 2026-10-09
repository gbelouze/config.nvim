-- [[ Git ]]
-- gitsigns is configured in init.lua

vim.pack.add {
  'https://github.com/tpope/vim-fugitive',
  'https://github.com/tpope/vim-rhubarb', -- :GBrowse for GitHub
  'https://github.com/sindrets/diffview.nvim',
  'https://github.com/aaronhallaert/advanced-git-search.nvim',
}

-- advanced-git-search's options are set in init.lua's telescope setup
require('telescope').load_extension 'advanced_git_search'
