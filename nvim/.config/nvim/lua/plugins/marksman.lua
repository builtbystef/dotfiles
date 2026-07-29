-- Marksman has no per-rule config, so drop its "Link to non-existent
-- document" diagnostics before they reach the UI.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {
          handlers = {
            ["textDocument/publishDiagnostics"] = function(err, result, ctx)
              if result and result.diagnostics then
                result.diagnostics = vim.tbl_filter(function(d)
                  return not d.message:find("non-existent document", 1, true)
                end, result.diagnostics)
              end
              vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
            end,
          },
        },
      },
    },
  },
}
