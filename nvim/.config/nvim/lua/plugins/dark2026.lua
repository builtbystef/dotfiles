-- VS Code "Dark 2026" (github_dark_default base + Dark 2026 token/UI overrides).
-- Dark 2026's own token colors are the GitHub Dark Default palette, but the theme
-- includes dark_modern.json -> dark_plus.json, whose more specific TextMate rules
-- and semantic tokens win for several scopes. Values below come straight from
-- microsoft/vscode extensions/theme-defaults/themes/*.json.
-- Revert to TokyoNight: change colorscheme below to "tokyonight" (or use <leader>uC).

local pink = "#C586C0" -- keyword.control (dark_plus)
local fg_var = "#C9D1D9" -- variable.other (2026-dark)
local blue = "#79C0FF" -- variable.other.constant (2026-dark)
local teal = "#4EC9B0" -- entity.name.type (dark_plus)
local green = "#7EE787" -- entity.name.tag / JSON property names (2026-dark)

return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = true,
    opts = {
      palettes = {
        github_dark_default = {
          canvas = { default = "#121314" }, -- editor.background
          fg = { default = "#BBBEBF" }, -- editor.foreground
        },
      },
      groups = {
        github_dark_default = {
          -- Control-flow keywords are pink in Dark 2026; storage keywords
          -- (const, function, let, class) stay GitHub red.
          ["@keyword.import"] = { fg = pink }, -- import / export / from
          ["@keyword.conditional"] = { fg = pink },
          ["@keyword.repeat"] = { fg = pink },
          ["@keyword.return"] = { fg = pink },
          ["@keyword.exception"] = { fg = pink },
          ["@keyword.coroutine"] = { fg = pink },
          Include = { fg = pink },
          Conditional = { fg = pink },
          Repeat = { fg = pink },
          Exception = { fg = pink },

          -- Plain variables and object keys are near-white; const/readonly
          -- bindings are blue (VS Code gets this from tsserver semantic tokens).
          ["@variable"] = { fg = fg_var },
          ["@variable.member"] = { fg = fg_var },
          ["@lsp.type.property"] = { fg = fg_var },
          ["@lsp.typemod.variable.readonly"] = { fg = blue },
          ["@lsp.type.enumMember"] = { fg = blue },

          -- Types are teal (from dark_plus). In JS/TS treesitter flags every
          -- Capitalized identifier as @type (VS Code does not), so neutralize
          -- it there — the LSP restores real types via @lsp.type.* below.
          ["@type"] = { fg = teal },
          ["@type.typescript"] = { fg = fg_var },
          ["@type.tsx"] = { fg = fg_var },
          ["@type.javascript"] = { fg = fg_var },
          ["@lsp.type.class"] = { fg = teal },
          ["@lsp.type.interface"] = { fg = teal },
          ["@lsp.type.enum"] = { fg = teal },
          ["@lsp.type.type"] = { fg = teal },
          ["@lsp.type.typeParameter"] = { fg = teal },
          ["@lsp.type.namespace"] = { fg = teal },

          -- Config/data keys are green in Dark 2026.
          ["@property.json"] = { fg = green },
          ["@property.yaml"] = { fg = green },
          ["@property.toml"] = { fg = green },

          -- Editor chrome.
          LineNr = { fg = "#858889" }, -- editorLineNumber.foreground
          CursorLineNr = { fg = "#BBBEBF" }, -- editorLineNumber.activeForeground
          CursorLine = { bg = "#242526" }, -- editor.lineHighlightBackground
          MatchParen = { bg = "#1F3E4C" }, -- editorBracketMatch.background (#3994BC55 on bg)
          Visual = { bg = "#245C73" }, -- editor.selectionBackground (#276782dd on bg)
          NeoTreeNormal = { fg = "#BFBFBF", bg = "#191A1B" }, -- sideBar
          NeoTreeNormalNC = { fg = "#BFBFBF", bg = "#191A1B" },
        },
      },
    },
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "github_dark_default" } },
}
