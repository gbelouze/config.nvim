# config.nvim

My Neovim configuration. It is built on
[kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) (single `init.lua`,
plugins managed with the built-in `vim.pack`, Neovim 0.12+) and ports the parts
of my previous lazy.nvim config, [gbelouze/init.nvim](https://github.com/gbelouze/init.nvim),
that I still use.

Kickstart's own modules live in `lua/kickstart/`. My additions live in
`lua/custom/plugins/*.lua`, `after/ftplugin/` and `snippets/`.

## Differences from vanilla kickstart.nvim

### Options and core keymaps

- `<localleader>` is `'`; Nerd Font enabled; relative numbers, 4-space tabs,
  soft wrap, no swapfile, `en_gb,fr` spelling, `conceallevel=2`, treesitter folds
  (off by default).
- `<C-c>` behaves exactly like `<Esc>` in every mode, including triggering
  `<Esc>` mappings.
- `<leader>q` quits, `<leader>w` writes, `gl` opens the diagnostic float,
  `<BS>` enters command-line mode, `Q` is disabled.
- `j`/`k` move by display line; `n`/`N`/`<C-d>`/`<C-u>` recentre; visual `J`/`K`
  move lines; `<`/`>` keep the selection; `<leader>rw`/`rW` replace the word
  under the cursor.
- `<leader>t` is Neo-tree (`tt`, `tw`, `tb`, `tg`…); kickstart's toggles moved
  to `<leader>u` (`uh` inlay hints, `ub` blame, `uw` word diff).
- `:Light` / `:Dark` switch colorschemes; `:LspCapabilities` inspects attached
  servers.

### Look

- [catppuccin](https://github.com/catppuccin/nvim) (frappé / latte) instead of
  tokyonight.
- [noice.nvim](https://github.com/folke/noice.nvim) +
  [nvim-notify](https://github.com/rcarriga/nvim-notify) (`<leader>su` dismisses),
  indent guides enabled.

### Editing and navigation

- mini.surround remapped to vim-surround style: `ys`, `ds`, `cs`, `yss`, visual `S`.
- mini.ai treesitter textobjects: `F` function, `c` class, `d` comment,
  `o` block/conditional/loop (next-object variants on `aN`/`iN`).
- [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects):
  `]f`/`[f`/`]F`/`[F` functions, `]k`/`[k`/`]K`/`[K` classes,
  `<leader>pp`/`pP` swap parameters.
- [leap.nvim](https://codeberg.org/andyg/leap.nvim) on `s`/`S`,
  [nvim-spider](https://github.com/chrisgrieser/nvim-spider) word motions,
  [oil.nvim](https://github.com/stevearc/oil.nvim),
  [zen-mode](https://github.com/folke/zen-mode.nvim), built-in undotree on `<leader>U`.
- [trouble.nvim](https://github.com/folke/trouble.nvim) (`<leader>x*`, `gR`,
  `<leader>j`/`k`) and refactoring.nvim (`<leader>re`, `rf`, `rv`).
- Autopairs enabled, with extra rules for tex, typst and markdown.

### Completion and snippets

- LuaSnip with autosnippets, my
  [friendly-snippets fork](https://github.com/gbelouze/friendly-snippets) and
  personal Lua snippets in `snippets/` (Lua, LaTeX maths/environments, Typst).
  `<C-d>`/`<C-u>` jump between placeholders, `<leader>L` reloads snippets.
- blink.cmp gains buffer, vimtex, LaTeX symbol and emoji sources per filetype.

### Language tooling

- LSP servers: ruff, ty, pyrefly, tinymist, markdown_oxide, ocamllsp, bashls,
  jsonls, yamlls, taplo. `gd` goes to definition.
- Formatters via conform (ruff, stylua, ocamlformat, typstyle, latexindent,
  shfmt, prettier, yamlfmt); `<leader>F` formats synchronously.
- **Python**: features split between ruff (lint/format), ty (navigation,
  completion) and pyrefly (hover, type diagnostics);
  [vim-slime](https://github.com/jpalardy/vim-slime) REPL on `<leader>R`;
  [neogen](https://github.com/danymat/neogen) numpydoc docstrings.
- **LaTeX**: [vimtex](https://github.com/lervag/vimtex) with Skim as viewer.
- **Typst**: tinymist with pin/unpin keymaps and auto-pinning of `main.typ`;
  [typst-preview.nvim](https://github.com/chomosuke/typst-preview.nvim).
- **Markdown**: markdown_oxide `:Daily`,
  [markview.nvim](https://github.com/OXY2DEV/markview.nvim) rendering,
  [bullets.vim](https://github.com/bullets-vim/bullets.vim) lists.
- **OCaml**: 2-space indentation.

### Git

- [fugitive](https://github.com/tpope/vim-fugitive) + rhubarb,
  [diffview](https://github.com/sindrets/diffview.nvim),
  [advanced-git-search](https://github.com/aaronhallaert/advanced-git-search.nvim);
  `<leader>hm` diffs against `main`.

## Installation

Requires Neovim 0.12+ and the external dependencies listed in
[kickstart's README](https://github.com/nvim-lua/kickstart.nvim#install-external-dependencies),
plus the language toolchains above (most servers and formatters are installed
through Mason).

```sh
git clone https://github.com/gbelouze/config.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
nvim
```
