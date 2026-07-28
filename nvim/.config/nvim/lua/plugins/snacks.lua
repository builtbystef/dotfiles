return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true, -- show dotfiles (.agents, .git, .env, ...)
            ignored = true, -- show git-ignored files (node_modules, etc.)
          },
          files = {
            hidden = true,
          },
          grep = {
            hidden = true,
          },
        },
      },
    },
  },
}
