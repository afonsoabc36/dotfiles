return {
  "junegunn/limelight.vim",
  config = function()
    -- Dimming coefficient (0.0 = very dim, 1.0 = barely dim)
    -- Lower values = more contrast between current paragraph and rest
    vim.g.limelight_default_coefficient = 0.8

    -- Include surrounding paragraphs (0 = only current paragraph)
    -- Set to 1 to also highlight the paragraph before and after
    vim.g.limelight_paragraph_span = 0

    -- Color settings for terminal
    vim.g.limelight_conceal_ctermfg = 240 -- Gray color for dimmed textlime

    -- Color settings for GUI (like Neovide, GVim)
    vim.g.limelight_conceal_guifg = "#777777"

    -- Paragraph detection (useful for code or indented text)
    -- Default detects paragraphs by empty lines
    -- Uncomment these if you want to detect by indentation:
    -- vim.g.limelight_bop = "^\\s" -- Beginning of paragraph
    -- vim.g.limelight_eop = "\\ze\\n^\\s" -- End of paragraph

    -- Keymaps
    vim.keymap.set("n", "<leader>ll", "<cmd>Limelight!! 0.8<CR>", { desc = "[L]ime[l]ight toggle" })
  end,
}
