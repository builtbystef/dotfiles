-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Show the Snacks dashboard when the last real file buffer is closed,
-- instead of leaving an empty [No Name] buffer on screen.
vim.api.nvim_create_autocmd("BufDelete", {
  group = vim.api.nvim_create_augroup("dashboard_on_last_close", { clear = true }),
  callback = function()
    -- BufDelete fires before the buffer is gone; check again afterwards.
    vim.schedule(function()
      if vim.v.exiting ~= vim.NIL or not Snacks then
        return
      end
      local real = vim.tbl_filter(function(b)
        return vim.api.nvim_buf_is_valid(b)
          and vim.bo[b].buflisted
          and vim.api.nvim_buf_get_name(b) ~= ""
      end, vim.api.nvim_list_bufs())
      if #real > 0 then
        return
      end
      -- Open in the main window, reusing the leftover [No Name] buffer.
      -- A bare Snacks.dashboard() would open a fullscreen float that covers
      -- the bufferline and centers across neo-tree.
      for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local b = vim.api.nvim_win_get_buf(win)
        if vim.bo[b].buftype == "" and vim.api.nvim_buf_get_name(b) == "" then
          Snacks.dashboard.open({ win = win, buf = b })
          return
        end
      end
    end)
  end,
})
