return {
  "mistricky/codesnap.nvim",
  config = function()
    local codesnap = require("codesnap")
    codesnap.setup({
      border = "rounded",
      has_breadcrumbs = true,
      bg_theme = "sea",
      watermark = "",
      code_font_family = "FiraCode Nerd Font",
      save_path = "~/Pictures",
      has_line_number = true,
    })

    local keymap = vim.keymap
    keymap.set("n", "<leader>cs", "<cmd>CodeSnap<CR>", { desc = "Save selected code snapshot into clipboard" })
    keymap.set("x", "<leader>cs", "<cmd>'<,'>CodeSnap<CR>", { desc = "Save selected code snapshot into clipboard" })
    keymap.set("n", "<leader>cc", "<cmd>CodeSnapSave<CR>", { desc = "Save selected code snapshot in ~/Pictures" })
    keymap.set("x", "<leader>cc", "<cmd>'<,'>CodeSnapSave<CR>", { desc = "Save selected code snapshot in ~/Pictures" })
    keymap.set("n", "<leader>ch", "<cmd>CodeSnapHighlight<CR>", { desc = "Highlight code inside the editor" })
    keymap.set("x", "<leader>ch", "<cmd>'<,'>CodeSnapHighlight<CR>", { desc = "Highlight code inside the editor" })
  end,
}
