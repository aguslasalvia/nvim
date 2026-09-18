-- fogwood: wood + forest-green, loosely built on Monokai's "vivid syntax on a
-- dark base" idea but deliberately pulled away from its look — true neutral
-- gray background (not Monokai's warm olive-black), and muted/earthy accents
-- instead of its neon-pastel palette. No violet/purple anywhere.

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "fogwood"

local c = {
  bg = "#292929",
  bg_dim = "#1c1c1c",
  bg_float = "#333333",
  bg_highlight = "#3d3d3d",
  bg_visual = "#4a4a4a",

  fg = "#e7e6e4",
  fg_dim = "#b5b2b0",
  fg_gutter = "#616161",

  border = "#454545",
  comment = "#938c85",
  non_text = "#3a3a3a",

  -- warm cluster: literal values (keyword / number / string), 30deg apart
  rust = "#da6262", -- keywords
  orange = "#d89e64", -- numbers / booleans / constants
  gold = "#ded573", -- strings, vivid (not pale)

  -- cool cluster: structure (function / property / type), 25-30deg apart
  green = "#46916b", -- function names (declarations + calls)
  cyan = "#69b8bf", -- property / member access (req.params, err.message)
  blue = "#6e9bcf", -- types / interfaces / classes

  var = "#b1bfc9", -- plain variables, pale and desaturated on purpose
  var_param = "#9eaab3", -- function parameters, a touch dimmer than var
  inlay_hint = "#858585", -- lsp inlay hints, readable light gray

  black = "#1c1c1c",
  white = "#f5f4f2",
}

local groups = {
  -- editor ui
  Normal = { fg = c.fg, bg = c.bg },
  NormalFloat = { fg = c.fg, bg = c.bg_float },
  NormalNC = { fg = c.fg, bg = c.bg },
  FloatBorder = { fg = c.border, bg = c.bg_float },
  FloatTitle = { fg = c.green, bg = c.bg_float, bold = true },
  Cursor = { fg = c.bg, bg = c.fg },
  CursorLine = { bg = c.bg_float },
  CursorLineNr = { fg = c.gold, bold = true },
  CursorColumn = { bg = c.bg_float },
  LineNr = { fg = c.fg_gutter },
  SignColumn = { fg = c.fg_gutter, bg = c.bg },
  FoldColumn = { fg = c.fg_gutter, bg = c.bg },
  Folded = { fg = c.fg_dim, bg = c.bg_float },
  Visual = { bg = c.bg_visual },
  VisualNOS = { bg = c.bg_visual },
  Search = { fg = c.bg, bg = c.gold },
  IncSearch = { fg = c.bg, bg = c.orange },
  CurSearch = { fg = c.bg, bg = c.orange },
  MatchParen = { fg = c.gold, bold = true },
  ColorColumn = { bg = c.bg_float },
  NonText = { fg = c.non_text },
  Whitespace = { fg = c.non_text },
  EndOfBuffer = { fg = c.bg },
  Directory = { fg = c.blue },
  Title = { fg = c.green, bold = true },
  StatusLine = { fg = c.fg_dim, bg = c.bg_dim },
  StatusLineNC = { fg = c.fg_gutter, bg = c.bg_dim },
  WinSeparator = { fg = c.border },
  VertSplit = { fg = c.border },
  TabLine = { fg = c.fg_gutter, bg = c.bg_dim },
  TabLineFill = { bg = c.bg_dim },
  TabLineSel = { fg = c.green, bg = c.bg_float, bold = true },
  Pmenu = { fg = c.fg, bg = c.bg_float },
  PmenuSel = { fg = c.bg, bg = c.green, bold = true },
  PmenuSbar = { bg = c.bg_float },
  PmenuThumb = { bg = c.border },
  WildMenu = { fg = c.bg, bg = c.green },
  Question = { fg = c.green },
  ModeMsg = { fg = c.fg_dim },
  MoreMsg = { fg = c.green },
  ErrorMsg = { fg = c.rust, bold = true },
  WarningMsg = { fg = c.orange, bold = true },
  SpecialKey = { fg = c.non_text },

  -- syntax
  Comment = { fg = c.comment, italic = true },
  Constant = { fg = c.orange },
  String = { fg = c.gold },
  Character = { fg = c.gold },
  Number = { fg = c.orange },
  Boolean = { fg = c.orange, bold = true },
  Float = { fg = c.orange },
  Identifier = { fg = c.var },
  Function = { fg = c.green, bold = true },
  Statement = { fg = c.rust },
  Conditional = { fg = c.rust },
  Repeat = { fg = c.rust },
  Label = { fg = c.rust },
  Operator = { fg = c.fg_dim },
  Keyword = { fg = c.rust, italic = true },
  Exception = { fg = c.rust },
  PreProc = { fg = c.rust },
  Include = { fg = c.rust },
  Define = { fg = c.rust },
  Macro = { fg = c.rust },
  PreCondit = { fg = c.rust },
  Type = { fg = c.blue },
  StorageClass = { fg = c.blue },
  Structure = { fg = c.blue },
  Typedef = { fg = c.blue },
  Special = { fg = c.gold },
  SpecialChar = { fg = c.gold },
  Tag = { fg = c.cyan },
  Delimiter = { fg = c.fg_dim },
  SpecialComment = { fg = c.comment, bold = true },
  Debug = { fg = c.rust },
  Underlined = { underline = true },
  Ignore = { fg = c.fg_gutter },
  Error = { fg = c.rust, bold = true },
  Todo = { fg = c.bg, bg = c.gold, bold = true },

  -- treesitter
  ["@variable"] = { fg = c.var },
  ["@variable.builtin"] = { fg = c.rust, italic = true },
  ["@variable.parameter"] = { fg = c.var_param },
  ["@variable.member"] = { fg = c.cyan },
  ["@constant"] = { fg = c.orange },
  ["@constant.builtin"] = { fg = c.orange, bold = true },
  ["@module"] = { fg = c.gold },
  ["@string"] = { link = "String" },
  ["@string.escape"] = { fg = c.orange, bold = true },
  ["@number"] = { link = "Number" },
  ["@boolean"] = { link = "Boolean" },
  ["@function"] = { link = "Function" },
  ["@function.builtin"] = { fg = c.green, italic = true },
  ["@function.method"] = { fg = c.green },
  ["@constructor"] = { fg = c.blue },
  ["@keyword"] = { link = "Keyword" },
  ["@keyword.function"] = { fg = c.rust, italic = true },
  ["@keyword.return"] = { fg = c.rust, bold = true },
  ["@keyword.operator"] = { fg = c.rust },
  ["@conditional"] = { link = "Conditional" },
  ["@repeat"] = { link = "Repeat" },
  ["@type"] = { link = "Type" },
  ["@type.builtin"] = { fg = c.blue, italic = true },
  ["@property"] = { fg = c.cyan },
  ["@field"] = { fg = c.cyan },
  ["@parameter"] = { fg = c.var_param },
  ["@tag"] = { link = "Tag" },
  ["@tag.attribute"] = { fg = c.orange },
  ["@tag.delimiter"] = { fg = c.fg_dim },
  ["@punctuation.bracket"] = { fg = c.fg_dim },
  ["@punctuation.delimiter"] = { fg = c.fg_dim },
  ["@punctuation.special"] = { fg = c.orange },
  ["@comment"] = { link = "Comment" },
  ["@comment.todo"] = { link = "Todo" },
  ["@operator"] = { link = "Operator" },

  -- lsp
  LspReferenceText = { bg = c.bg_highlight },
  LspReferenceRead = { bg = c.bg_highlight },
  LspReferenceWrite = { bg = c.bg_highlight },
  LspSignatureActiveParameter = { fg = c.gold, bold = true },
  LspCodeLens = { fg = c.fg_gutter, italic = true },
  LspInlayHint = { fg = c.inlay_hint, italic = true },
  DiagnosticError = { fg = c.rust },
  DiagnosticWarn = { fg = c.orange },
  DiagnosticInfo = { fg = c.cyan },
  DiagnosticHint = { fg = c.cyan },
  DiagnosticOk = { fg = c.green },
  DiagnosticUnderlineError = { undercurl = true, sp = c.rust },
  DiagnosticUnderlineWarn = { undercurl = true, sp = c.orange },
  DiagnosticUnderlineInfo = { undercurl = true, sp = c.cyan },
  DiagnosticUnderlineHint = { undercurl = true, sp = c.cyan },
  DiagnosticVirtualTextError = { fg = c.rust, bg = c.bg_dim },
  DiagnosticVirtualTextWarn = { fg = c.orange, bg = c.bg_dim },
  DiagnosticVirtualTextInfo = { fg = c.cyan, bg = c.bg_dim },
  DiagnosticVirtualTextHint = { fg = c.cyan, bg = c.bg_dim },

  -- gitsigns / diff
  DiffAdd = { fg = c.green, bg = c.bg_float },
  DiffChange = { fg = c.gold, bg = c.bg_float },
  DiffDelete = { fg = c.rust, bg = c.bg_float },
  DiffText = { fg = c.blue, bg = c.bg_float },
  GitSignsAdd = { fg = c.green },
  GitSignsChange = { fg = c.gold },
  GitSignsDelete = { fg = c.rust },

  -- telescope
  TelescopeNormal = { fg = c.fg, bg = c.bg_float },
  TelescopeBorder = { fg = c.border, bg = c.bg_float },
  TelescopePromptNormal = { fg = c.fg, bg = c.bg_highlight },
  TelescopePromptBorder = { fg = c.border, bg = c.bg_highlight },
  TelescopePromptPrefix = { fg = c.green },
  TelescopeSelection = { bg = c.bg_highlight, bold = true },
  TelescopeMatching = { fg = c.gold, bold = true },

  -- which-key
  WhichKey = { fg = c.green, bold = true },
  WhichKeyGroup = { fg = c.blue },
  WhichKeyDesc = { fg = c.fg },
  WhichKeySeparator = { fg = c.fg_gutter },
  WhichKeyFloat = { bg = c.bg_float },

  -- indent guides / misc
  IblIndent = { fg = c.non_text },
  IblScope = { fg = c.comment },
  NotifyINFOBorder = { fg = c.cyan },
  NotifyWARNBorder = { fg = c.orange },
  NotifyERRORBorder = { fg = c.rust },
  NotifyINFOTitle = { fg = c.cyan },
  NotifyWARNTitle = { fg = c.orange },
  NotifyERRORTitle = { fg = c.rust },
}

for group, opts in pairs(groups) do
  vim.api.nvim_set_hl(0, group, opts)
end
