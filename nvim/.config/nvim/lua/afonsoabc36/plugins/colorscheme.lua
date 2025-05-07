return {
  "folke/tokyonight.nvim",
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    vim.cmd.colorscheme("tokyonight-night")
    vim.cmd.hi("Comment gui=none")
  end,
}
-- lua/plugins/rose-pine.lua
-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   config = function()
--     -- vim.cmd("colorscheme rose-pine")
--   end,
-- }
-- light
-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   config = function()
--     vim.cmd("colorscheme catppuccin-latte")
--   end,
--   priority = 1000,
-- }
