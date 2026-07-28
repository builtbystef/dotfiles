-- nvim-lint runs markdownlint-cli2 over stdin, so it never sees the file's
-- path and skips config discovery; point it at the global config explicitly.
return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = { "--config", vim.fn.stdpath("config") .. "/markdownlint.yaml", "-" },
        },
      },
    },
  },
}
