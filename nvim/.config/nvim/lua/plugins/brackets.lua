-- VS Code-style nested bracket pair colorization (gold/orchid/blue).
-- These are VS Code's built-in editorBracketHighlight defaults, which the
-- Dark 2026 theme inherits unchanged.
return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "LazyFile",
    config = function()
      local colors = {
        RainbowDelimiterVSCode1 = "#FFD700",
        RainbowDelimiterVSCode2 = "#DA70D6",
        RainbowDelimiterVSCode3 = "#179FFF",
      }
      local function set_hl()
        for group, fg in pairs(colors) do
          vim.api.nvim_set_hl(0, group, { fg = fg })
        end
      end
      set_hl()
      vim.api.nvim_create_autocmd("ColorScheme", { callback = set_hl })
      require("rainbow-delimiters.setup").setup({
        highlight = {
          "RainbowDelimiterVSCode1",
          "RainbowDelimiterVSCode2",
          "RainbowDelimiterVSCode3",
        },
      })
    end,
  },
}
