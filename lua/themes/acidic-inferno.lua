-- Neon Inferno theme for NvChad

---@type Base46Table
local M = {}

-- UI
M.base_30 = {
  white = "#F8F8F2", -- light foreground
  darker_black = "#0d0d0d", -- almost black background
  black = "#1a1a1a", -- dark one_bg3 (slightly lighter)
  black2 = "#333333", -- medium one_bg3
  one_bg = "#595959", -- light one_bg3
  one_bg2 = "#666666", -- subtle lighter one_bg3
  one_bg3 = "#808080", -- neutral one_bg3
  grey = "#FF2400", -- fiery red (errors, criticals)
  grey_fg = "#800000", -- dark red (variables)
  grey_fg2 = "#8B0000", -- deep red (rare)
  light_grey = "#DC143C", -- light_grey red (bold identifiers)
  red = "#FF4500", -- pink red (keywords)
  baby_pink = "#FF8C00", -- dark pink (constants)
  pink = "#FFA500", -- pink (punctuation)
  line = "#FF6347", -- line (numbers)
  green = "#FF7F50", -- green (strings, escape characters)
  vibrant_green = "#FA8072", -- vibrant_green (light red tones)
  blue = "#FFA07A", -- light vibrant_green (strings)
  nord_blue = "#FF5349", -- red pink (second-level accents)
  yellow = "#FF4A59", -- bright red (functions)
  sun = "#FF6E6E", -- light red (conditionals, loops)
  purple = "#FFD700", -- purple (function and method names)
  dark_purple = "#FFFF00", -- yellow (tag names, important elements)
  teal = "#DAA520", -- teal (lesser-used elements)
  orange = "#B8860B", -- dark teal (rare)
  cyan = "#EEE8AA", -- pale yellow (light highlights)
  statusline_bg = "#EEE8AA", -- pale teal (light background)
  lightbg = "#FF6347", -- line (nvimtree items)
  pmenu_bg = "#39FF14", -- acid green (comments)
  folder_bg = "#98FB98", -- pale green (special comments)
}

M.base_16 = {
  base00 = M.base_30.darker_black,
  base01 = M.base_30.black2,
  base02 = M.base_30.black2,
  base03 = M.base_30.one_bg2,
  base04 = M.base_30.one_bg,
  base05 = M.base_30.one_bg3,
  base06 = M.base_30.grey,
  base07 = M.base_30.purple,
  base08 = M.base_30.one_bg2,
  base09 = M.base_30.grey,
  base0A = M.base_30.green,
  base0B = M.base_30.red,
  base0C = M.base_30.light_grey,
  base0D = M.base_30.baby_pink,
  base0E = M.base_30.line,
  base0F = M.base_30.pink,
}

M.polish_hl = {
  -- Treesitter highlights
  treesitter = {
    ["@variable"] = { fg = M.base_16.base08 },
    ["@variable.builtin"] = { fg = M.base_16.base09 },
    ["@variable.parameter"] = { fg = M.base_16.base08 },
    ["@variable.member"] = { fg = M.base_16.base08 },
    ["@variable.member.key"] = { fg = M.base_16.base08 },

    ["@module"] = { fg = M.base_16.base0D },

    ["@constant"] = { fg = M.base_16.base0E },
    ["@constant.builtin"] = { fg = M.base_16.base09 },
    ["@constant.macro"] = { fg = M.base_16.base0C },

    ["@string"] = { fg = M.base_16.base0B },
    ["@string.regex"] = { fg = M.base_16.base0C },
    ["@string.escape"] = { fg = M.base_16.base0C },
    ["@character"] = { fg = M.base_16.base09 },

    ["@number"] = { fg = M.base_16.base09 },
    ["@number.float"] = { fg = M.base_16.base09 },

    ["@annotation"] = { fg = M.base_16.base0F },
    ["@attribute"] = { fg = M.base_16.base0A },
    ["@error"] = { fg = M.base_16.base08 },

    ["@keyword.exception"] = { fg = M.base_16.base06 },
    ["@keyword"] = { fg = M.base_16.base07 },
    ["@keyword.function"] = { fg = M.base_16.base0F },
    ["@keyword.return"] = { fg = M.base_16.base08 },
    ["@keyword.operator"] = { fg = M.base_30.grey_fg },
    ["@keyword.import"] = { link = "Include" },
    ["@keyword.conditional"] = { fg = M.base_16.base0F },
    ["@keyword.conditional.ternary"] = { fg = M.base_16.base0E },
    ["@keyword.repeat"] = { fg = M.base_16.base0A },
    ["@keyword.storage"] = { fg = M.base_30.green },
    ["@keyword.directive.define"] = { fg = M.base_16.base0B },
    ["@keyword.directive"] = { fg = M.base_16.base0D },

    ["@function"] = { fg = M.base_16.base0D },
    ["@function.builtin"] = { fg = M.base_16.base0D },
    ["@function.macro"] = { fg = M.base_16.base0C },
    ["@function.call"] = { fg = M.base_16.base0D },
    ["@function.method"] = { fg = M.base_16.base0D },
    ["@function.method.call"] = { fg = M.base_16.base0D },
    ["@constructor"] = { fg = M.base_16.base0C },

    ["@operator"] = { fg = M.base_30.grey_fg },
    ["@reference"] = { fg = M.base_16.base05 },
    ["@punctuation.bracket"] = { fg = M.base_16.base09 },
    ["@punctuation.delimiter"] = { fg = M.base_16.base09 },
    ["@symbol"] = { fg = M.base_16.base0B },
    ["@tag"] = { fg = M.base_16.base0A },
    ["@tag.attribute"] = { fg = M.base_16.base0E },
    ["@tag.delimiter"] = { fg = M.base_16.base0F },
    ["@text"] = { fg = M.base_16.base05 },
    ["@text.emphasis"] = { fg = M.base_16.base09 },
    ["@text.strike"] = { fg = M.base_16.base0F, strikethrough = true },
    ["@type.builtin"] = { fg = M.base_16.base0A },
    ["@definition"] = { sp = M.base_16.base04, underline = true },
    ["@scope"] = { bold = true },
    ["@property"] = { fg = M.base_16.base0E },

    -- Markup highlights
    ["@markup.heading"] = { fg = M.base_16.base0D },
    ["@markup.raw"] = { fg = M.base_16.base09 },
    ["@markup.link"] = { fg = M.base_16.base08 },
    ["@markup.link.url"] = { fg = M.base_16.base09, underline = true },
    ["@markup.link.label"] = { fg = M.base_16.base0C },
    ["@markup.list"] = { fg = M.base_16.base08 },
    ["@markup.strong"] = { bold = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.quote"] = { bg = M.base_30.black },

    -- Comment highlights
    ["@comment"] = { fg = M.base_30.pmenu_bg },
    ["@comment.todo"] = { fg = M.base_30.one_bg, bg = M.base_30.white },
    ["@comment.warning"] = { fg = M.base_30.black, bg = M.base_16.base09 },
    ["@comment.note"] = { fg = M.base_30.black, bg = M.base_30.black2 },
    ["@comment.danger"] = { fg = M.base_30.black, bg = M.base_30.one_bg2 },

    -- Diff highlights
    ["@diff.plus"] = { fg = M.base_30.red },
    ["@diff.minus"] = { fg = M.base_30.one_bg2 },
    ["@diff.delta"] = { fg = M.base_30.grey_fg },
  },

  -- NvimTree highlights
  nvimtree = {
    NvimTreeEmptyFolderName = { fg = M.base_30.vibrant_green },
    NvimTreeEndOfBuffer = { fg = M.base_30.black },
    NvimTreeFolderIcon = { fg = M.base_30.vibrant_green },
    NvimTreeFolderName = { fg = M.base_30.vibrant_green },
    NvimTreeFolderArrowOpen = { fg = M.base_30.vibrant_green },
    NvimTreeFolderArrowClosed = { fg = M.base_30.white },
    NvimTreeGitDirty = { fg = M.base_30.one_bg2 },
    NvimTreeIndentMarker = { fg = M.base_30.black2 },
    NvimTreeNormal = { bg = M.base_30.one_bg3 },
    NvimTreeNormalNC = { bg = M.base_30.one_bg3 },
    NvimTreeOpenedFolderName = { fg = M.base_30.vibrant_green },
    NvimTreeGitIgnored = { fg = M.base_30.one_bg },

    NvimTreeWinSeparator = {
      fg = M.base_30.one_bg3,
      bg = M.base_30.one_bg3,
    },

    NvimTreeWindowPicker = {
      fg = M.base_30.one_bg2,
      bg = M.base_30.black,
    },

    NvimTreeCursorLine = {
      bg = M.base_30.black,
    },

    NvimTreeGitNew = {
      fg = M.base_30.green,
    },

    NvimTreeGitDeleted = {
      fg = M.base_30.one_bg2,
    },
    NvimTreeSpecialFile = {
      fg = M.base_30.green,
      bold = true,
    },

    NvimTreeRootFolder = {
      fg = M.base_30.one_bg2,
      bold = true,
    },
  },
}

M.type = "dark"

-- This will be later used for users to override your theme table from chadrc
M = require("base46").override_theme(M, "acidic_inferno")

return M
