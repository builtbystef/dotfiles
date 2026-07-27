-- Always show the buffer tab bar (VS Code-style tabs), even with one buffer.
-- Filename, close button, and modified indicator are bufferline defaults.
return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
        -- Hide unnamed [No Name] buffers (e.g. the placeholder left after
        -- closing the last file) so they don't get a tab.
        custom_filter = function(buf)
          return vim.api.nvim_buf_get_name(buf) ~= ""
        end,
      },
    },
  },
}
