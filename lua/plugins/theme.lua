-- Rose Pine, regrown in the forest from the current wallpaper
-- (~/Downloads/fog-wallpaper-3840x2160-misty-hd-577.jpg: pine silhouettes
-- fading into teal fog). Keeps Rose Pine's structure and semantics (love /
-- gold / rose / pine / foam / iris / leaf) but recolors the accents from
-- purple-twilight to misty pine-forest. The background stays a neutral
-- charcoal (not green) so the forest tones read as syntax accents, not a
-- tinted editor background. Tuned for Go, Node/TypeScript and web work
-- (JSX/TSX, HTML, CSS, JSON).
return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
      variant = "main",
      dark_variant = "main",
      dim_inactive_windows = false,
      extend_background_behind_borders = true,

      enable = {
        terminal = true,
        legacy_highlights = true,
        migrations = true,
      },

      styles = {
        bold = true,
        italic = true,
        transparency = false,
      },

      palette = {
        main = {
          _nc = "#131514",
          base = "#191b1a", -- neutral charcoal, no green tint
          surface = "#1e2120",
          overlay = "#282b29",
          muted = "#71827e",
          subtle = "#9aada9",
          text = "#e4e8e6",
          love = "#e8748a", -- errors, keywords, tags
          gold = "#e0b168", -- functions, numbers, constants
          rose = "#e3a6a0", -- constructors, JSX components
          pine = "#3f8f7d", -- modules/packages, links, notes
          foam = "#7fd4c9", -- types
          iris = "#b39ddb", -- parameters, decorators, imports
          leaf = "#7ea88f", -- strings, diff-add
          highlight_low = "#232625",
          highlight_med = "#383c3a",
          highlight_high = "#4a4f4c",
        },
      },

      groups = {
        git_add = "leaf",
      },

      highlight_groups = {
        -- keywords / control flow (func, if, for, return, const, interface, struct...)
        ["@keyword"] = { fg = "love" },
        ["@keyword.function"] = { fg = "love", italic = true },
        ["@keyword.return"] = { fg = "love", bold = true },
        ["@keyword.import"] = { fg = "iris", italic = true }, -- import/require/package
        ["@keyword.operator"] = { fg = "love" },
        ["@conditional"] = { fg = "love" },
        ["@repeat"] = { fg = "love" },

        -- functions & calls
        ["@function"] = { fg = "gold", bold = true },
        ["@function.call"] = { fg = "gold" },
        ["@function.method"] = { fg = "gold" },
        ["@function.method.call"] = { fg = "gold" },
        ["@function.builtin"] = { fg = "gold", italic = true },
        ["@constructor"] = { fg = "rose", bold = true }, -- Go struct literals, JSX components, `new Foo()`

        -- types (Go structs/interfaces, TS types/generics)
        ["@type"] = { fg = "foam" },
        ["@type.builtin"] = { fg = "foam", italic = true },
        ["@type.definition"] = { fg = "foam", bold = true },

        -- variables, params, fields (struct fields / object props)
        ["@variable"] = { fg = "text" },
        ["@variable.parameter"] = { fg = "iris" },
        ["@variable.member"] = { fg = "subtle" },
        ["@property"] = { fg = "subtle" },
        ["@field"] = { fg = "subtle" },
        ["@module"] = { fg = "pine", bold = true }, -- Go package clause, JS module specifiers

        -- literals
        ["@string"] = { fg = "leaf" },
        ["@string.special"] = { fg = "gold" },
        ["@string.escape"] = { fg = "gold", bold = true },
        ["@string.regex"] = { fg = "rose" },
        ["@number"] = { fg = "gold" },
        ["@boolean"] = { fg = "gold", bold = true },
        ["@constant"] = { fg = "gold" },
        ["@constant.builtin"] = { fg = "gold", bold = true }, -- nil/true/false/null/undefined

        -- web markup (HTML/JSX/TSX)
        ["@tag"] = { fg = "love" },
        ["@tag.attribute"] = { fg = "gold", italic = true },
        ["@tag.delimiter"] = { fg = "muted" },
        ["@attribute"] = { fg = "iris", italic = true }, -- decorators, JSX spread, Go struct tags

        -- punctuation stays quiet so the syntax colors pop
        ["@punctuation.bracket"] = { fg = "subtle" },
        ["@punctuation.delimiter"] = { fg = "muted" },
        ["@punctuation.special"] = { fg = "love" }, -- template literal ${}

        -- JSON keys (package.json, tsconfig.json, ...) and goto labels
        ["@label"] = { fg = "iris" },

        ["@comment"] = { fg = "muted", italic = true },
        ["@markup.link.url"] = { fg = "pine", underline = true },
      },
    },
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "rose-pine" } },
}
