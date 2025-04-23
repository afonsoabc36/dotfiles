return {
  "easymotion/vim-easymotion",
  config = function()
    -- Basic configuration
    vim.g.EasyMotion_do_mapping = 0 -- Disable default mappings
    -- vim.api.nvim_set_keymap("n", "<Leader><Leader>s", "<Plug>(easymotion-overwin-f)", {}) -- Não funciona bem com o noice.nvim
    vim.api.nvim_set_keymap("n", "ç", "<Plug>(easymotion-bd-f)", {})
    vim.api.nvim_set_keymap("n", "<leader>ç", "<Plug>(easymotion-s2)", {})
  end,
}
