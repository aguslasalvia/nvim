# AGENTS.md

LazyVim-based Neovim config. Notes for coding agents working in this repo.

## Colorscheme

- `lua/plugins/theme.lua` is the source of truth. It configures `rose-pine/neovim`
  with a custom palette and `LazyVim.opts.colorscheme = "rose-pine"`.
- The palette is Rose Pine's structure/semantics (`love`/`gold`/`rose`/`pine`/`foam`/
  `iris`/`leaf`) recolored from purple-twilight to a misty pine-forest palette
  pulled from the user's wallpaper at the time
  (`~/Downloads/fog-wallpaper-3840x2160-misty-hd-577.jpg`). Background stays
  neutral charcoal on purpose (user dislikes a tinted/green editor background) —
  the forest greens are accent colors only, applied via `highlight_groups`.
- `highlight_groups` in that file is tuned for Go, Node/TypeScript and web
  (JSX/TSX, HTML, CSS, JSON) — keep that focus when adjusting it.
- `colors/fogwood.lua` is an older, unrelated standalone colorscheme
  (Monokai-inspired, no purple) kept around but not currently selected. Don't
  merge concepts from it into the rose-pine palette unless asked.
- When changing colors, validate with:
  `nvim --headless -c "lua vim.defer_fn(function() print(vim.g.colors_name); vim.cmd('qa') end, 800)"`

## Structure

- `lua/config/` — LazyVim core config (options, keymaps, autocmds, lazy bootstrap).
- `lua/plugins/` — one file per plugin/feature; each returns a lazy.nvim spec table.
